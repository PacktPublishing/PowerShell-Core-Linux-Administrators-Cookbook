function New-PersonalMessage {
    [CmdletBinding(DefaultParameterSetName='Audio')]
    param (
        # The phone number
        [Parameter(Mandatory=$true, Position=0, ParameterSetName='Audio')]
        [Parameter(Mandatory=$true, Position=0, ParameterSetName='Text')]
        [string]
        $PhoneNumber,

        # The path to the WAV file
        [Parameter(Mandatory=$true, Position=1, ParameterSetName='Audio')]
        [string]
        $WavPath,

        # The message to be sent
        [Parameter(Mandatory=$true, Position=1, ParameterSetName='Text')]
        [string]
        $Message
    )
    
    if ($WavPath) {

    }
}