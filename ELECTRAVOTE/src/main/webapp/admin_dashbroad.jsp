<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // If admin not logged in, redirect
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - ElectraVote</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

/* Background */
body {
    margin: 0;
    background: radial-gradient(circle at top, #112237, #0b1220 60%, #070b14);
    font-family: 'Segoe UI', sans-serif;
    color: #e8eef7;
}

/* Neon Glass Card */
.card-neon {
    background: rgba(255,255,255,0.06);
    backdrop-filter: blur(12px);
    border-radius: 14px;
    padding: 22px;
    border: 1px solid rgba(255,255,255,0.15);
    box-shadow: 0 0 18px rgba(94,252,232,0.18);
    transition: all .25s ease-in-out;
}
.card-neon:hover {
    transform: translateY(-6px);
    box-shadow: 0 0 28px rgba(94,252,232,0.35);
}

/* Neon Buttons */
.btn-neon {
    background: linear-gradient(120deg,#5efce8,#736efe);
    border: none;
    color: #04121a;
    font-weight: 600;
    border-radius: 8px;
    transition: .25s;
}
.btn-neon:hover {
    opacity: 0.85;
}

/* Top Bar */
.topbar {
    padding: 18px 35px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    background: rgba(255,255,255,0.04);
    backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(255,255,255,0.1);
    box-shadow: 0 4px 20px rgba(0,0,0,0.35);
}

.topbar h3 {
    font-weight: 700;
    margin: 0;
    color: #5efce8;
}

.muted {
    color: #aab6c3;
}

/* Quick Action Button */
.quick-btn {
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    background: rgba(255,255,255,0.08);
    border-radius: 8px;
    color: #e6ebf3;
    text-decoration: none;
    display: block;
    text-align: center;
    transition: .3s ease;
}
.quick-btn:hover {
    background: rgba(255,255,255,0.14);
}

/* Chart Card */
.chart-container {
    padding: 25px;
    height: 350px;
}

</style>
</head>

<body>

<!-- TOP NAV BAR -->
<div class="topbar">
    <div>
        <h3>ElectraVote Admin</h3>
        <div class="muted">Welcome, <%= session.getAttribute("adminName") %></div>
    </div>

    <div>
        <a href="manage_candidates.jsp" class="btn btn-neon me-2">Candidates</a>
        <a href="manage_users.jsp" class="btn btn-neon me-2">Voters</a>
        <a href="view_results.jsp" class="btn btn-neon me-2">Results</a>
        <a href="admin_logout.jsp" class="btn btn-light">Log Out</a>
    </div>
</div>



<!-- MAIN CONTAINER -->
<div class="container mt-4">

    <!-- STATS GRID -->
    <div class="row g-4">

        <!-- Voters -->
        <div class="col-md-4">
            <div class="card-neon">
                <h6 class="muted">Registered Voters</h6>
                <div style="font-size: 2.5rem; font-weight: 700;">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electravote","root","7319425477");
                        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM register");
                        ResultSet rs = ps.executeQuery(); rs.next(); out.print(rs.getInt(1));
                        con.close();
                    } catch(Exception e){ out.print("—"); }
                %>
                </div>
            </div>
        </div>

        <!-- Candidates -->
        <div class="col-md-4">
            <div class="card-neon">
                <h6 class="muted">Total Candidates</h6>
                <div style="font-size: 2.5rem; font-weight: 700;">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electravote","root","7319425477");
                        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM candidates");
                        ResultSet rs = ps.executeQuery(); rs.next(); out.print(rs.getInt(1));
                        con.close();
                    } catch(Exception e){ out.print("—"); }
                %>
                </div>
            </div>
        </div>

        <!-- Votes -->
        <div class="col-md-4">
            <div class="card-neon">
                <h6 class="muted">Votes Cast</h6>
                <div style="font-size: 2.5rem; font-weight: 700;">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electravote","root","7319425477");
                        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM votes");
                        ResultSet rs = ps.executeQuery(); rs.next(); out.print(rs.getInt(1));
                        con.close();
                    } catch(Exception e){ out.print("—"); }
                %>
                </div>
            </div>
        </div>

    </div>


    <!-- ROW 2: CHART + QUICK ACTIONS -->
    <div class="row mt-4">

        <!-- Chart -->
        <div class="col-md-8">
            <div class="card-neon chart-container">
                <canvas id="resultChart"></canvas>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="col-md-4">
            <div class="card-neon">
                <h6 class="muted">Quick Actions</h6>

                <a class="quick-btn" href="manage_candidates.jsp">Add / Edit Candidates</a>
                <a class="quick-btn" href="manage_users.jsp">View Voters</a>
                <a class="quick-btn" href="view_results.jsp">View Election Results</a>
            </div>
        </div>
    </div>

</div>


<!-- CHART JS -->
<script>
const labels = [
<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electravote","root","7319425477");
    PreparedStatement ps = con.prepareStatement("SELECT DISTINCT candidate FROM votes");
    ResultSet rs = ps.executeQuery();
    boolean first = true;
    while(rs.next()){
        if(!first) out.print(",");
        out.print("\""+rs.getString(1)+"\"");
        first = false;
    }
    con.close();
}catch(Exception e){}
%>
];

const data = [
<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electravote","root","7319425477");
    PreparedStatement ps = con.prepareStatement("SELECT candidate, COUNT(*) FROM votes GROUP BY candidate");
    ResultSet rs = ps.executeQuery();
    boolean first = true;
    while(rs.next()){
        if(!first) out.print(",");
        out.print(rs.getInt(2));
        first = false;
    }
    con.close();
}catch(Exception e){}
%>
];

new Chart(document.getElementById("resultChart"), {
    type: "doughnut",
    data: {
        labels: labels,
        datasets: [{
            data: data,
            borderWidth: 2
        }]
    }
});
</script>

</body>
</html>
