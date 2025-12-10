from flask import Flask
import tensorflow as tf
from tensorflow.keras.models import load_model
import os
import sys

# ✅ Define proper L2Normalize layer
class L2Normalize(tf.keras.layers.Layer):
    def __init__(self, axis=-1, **kwargs):
        super(L2Normalize, self).__init__(**kwargs)
        self.axis = axis

    def call(self, inputs):
        return tf.nn.l2_normalize(inputs, axis=self.axis)

    def get_config(self):
        config = super(L2Normalize, self).get_config()
        config.update({"axis": self.axis})
        return config

# Register custom layer globally
tf.keras.utils.get_custom_objects()['L2Normalize'] = L2Normalize

app = Flask(__name__)

H5_PATH = "face_recognition_model.h5"
SAVEDMODEL_PATH = "face_recognition_model_fixed"

def convert_h5_to_savedmodel():
    print("⚠️ Converting .h5 model to SavedModel format...", flush=True)
    try:
        model = load_model(H5_PATH, compile=False, safe_mode=False)
        model.save(SAVEDMODEL_PATH, save_format="tf")
        print("✅ Conversion complete! SavedModel created.", flush=True)
    except Exception as e:
        print(f"❌ Conversion failed: {e}", flush=True)
        sys.exit(1)  # stop if conversion fails

# Ensure SavedModel exists
if not os.path.exists(SAVEDMODEL_PATH):
    convert_h5_to_savedmodel()

# Load the SavedModel safely
try:
    model = load_model(SAVEDMODEL_PATH,
                       compile=False,
                       custom_objects={"L2Normalize": L2Normalize})
    print("✅ Model loaded successfully from SavedModel!", flush=True)
except Exception as e:
    print(f"❌ Model load failed: {e}", flush=True)
    sys.exit(1)

@app.route("/")
def home():
    return jsonify({"status": "server running", "model_loaded": True})

if __name__ == '__main__':
    print("🚀 Starting Flask server...", flush=True)
    app.run(host='0.0.0.0', port=5000, debug=True)