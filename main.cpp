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
#include <QApplication>
#include <QtCore/Qt>
#include <QString>
#include <QProcess>
#include <QDeclarativeItem>
#include "qmlapplicationviewer.h"

/*class Backend: public QObject{
    signals:
        void createWindow(QString title, QDeclarativeItem widget);
    void declareWindow(QString title, QDeclarativeItem widget){
        emit declareWindow(title, widget);
    }
}*/

/*QString* systemUsage(){
    QProcess top;
    QString topOutputString;
    top.start("top");
    top.waitForFinished();
    QTextStream topOutput(*top);
    while(!top.atEnd()){
        topOutputString.append(topOutput.readAll());
    }
    cout << topOutputString->unicode();
    return "test";
}*/

Q_DECL_EXPORT
int main(int argc, char *argv[]){
    QScopedPointer<QApplication> app(createApplication(argc, argv));


    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/CTU-Desktop/CTU-Desktop.qml"));
    viewer.showExpanded();
    /*viewer.rootObject()->setProperty("state", "signedOut");*/
    viewer.setWindowState(Qt::WindowFullScreen);

    return app->exec();
}
