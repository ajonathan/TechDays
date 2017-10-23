Configuration LinuxWebYum
{
    Import-DSCResource -Module nx
    
    Node "httpd"
    {
        nxPackage httpdInstall
        {
            Name = "httpd"
            Ensure = "Present"
            PackageManager = "Yum"
        }

        nxService httpdService
        {
            Name = "httpd"
            Controller = "systemd"
            Enabled = $true
            State = "Running"
        }    

        nxFile httpdFile
        {
            Ensure = "Present"
            Type = "File"
            DestinationPath = "/var/www/html/index.html"
            Contents = '<!DOCTYPE html>
<html>
<head>
<title>My DSC Linux Apache Test Page</title>
</head>
<body bgcolor="#00c87c">
<h3 style="color:blue">This Httpd server and webpage is installed and configured by DSC on Linux</h3>
</body>
</html>'
        }
    }
}