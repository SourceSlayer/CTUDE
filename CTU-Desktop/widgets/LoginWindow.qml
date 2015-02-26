/*
Copyright (c) 2014-2015, Seth Nash
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the <organization>.
4. Neither the name of the <organization> nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY <COPYRIGHT HOLDER> ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Window{
    id:loginWindow
    windowTitle:"Login to CTU"
    property color color:"blue"
    width:600
    height:400
    Rectangle{
        id:content
        anchors.fill: parent.contents
        color:parent.color
        Image {
            id: ctuEmblem
            source: "../images/CTU-emblem.png"
            height:parent.height*.75
            width:parent.width*.75
            fillMode:Image.PreserveAspectFit
            anchors.centerIn: parent
            smooth:true

        }
        Rectangle{
            id:credentialsContainer
            anchors.fill:parent
            color:"transparent"

            Column{
                id:credentialColumn
                opacity:.7;
                anchors.centerIn: parent
                Row{
                    spacing:parent.width*.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{
                        id:usernameLabel
                        color:"grey"
                        text:"Username: "
                        font.pixelSize: 22
                    }
                    Rectangle{
                        border.width: 1
                        width:(loginWindow.width-usernameLabel.width)*.5
                        height:usernameLabel.height
                        TextInput{
                            id:username
                            font.pixelSize: 22
                            width:parent.width
                            cursorVisible: true
                            KeyNavigation.tab: password
                        }
                    }
                }
                Row{
                    spacing:parent.width*.21
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{
                        id:passswordLabel
                        color:"grey"
                        text:"Password: "
                        font.pixelSize: 22
                    }
                    Rectangle{
                        border.width: 1
                        width:(loginWindow.width-usernameLabel.width)*.5
                        height:username.height
                        TextInput{
                            id:password
                            font.pixelSize: 21
                            width:parent.width
                            echoMode:TextInput.Password
                        }
                    }
                }
                Row{
                    width:parent.width*.75
                    height:50
                    MenuButton{
                        id:loginButton
                        text:"Login"
                        width:50
                        height:25
                    }
                    LinkButton{
                        text:"Request Password Reset"
                    }
                }
            }
        }
    }
    onHoveredChanged: {
        if(hovered)
            credentialColumn.opacity=1
        else
            credentialColumn.opacity=.5
    }
}
