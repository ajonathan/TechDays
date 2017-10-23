# WebServer Features

Configuration WinIISFeature 
{
    Import-DscResource –ModuleName ’PSDesiredStateConfiguration’
    
    Node localhost
    {

        #Install IIS
        WindowsFeature IIS 
        {
            Ensure = "Present"
            Name = "Web-Server"
        }
    }
}