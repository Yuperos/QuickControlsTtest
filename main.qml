import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

ApplicationWindow {
   id: appWin
   visible: true
   width: 640
   height: 480

   title: qsTr("Hello World")

   signal qmlSignal(string msg)

   Item{
      property Component mycomponent: comp1

      Component {
         id: comp1
         Rectangle {
            width: 50; height: 50
            color: "#00000000"
            radius: Math.min (width, height) * 0.5;
            RadialGradient{
               horizontalRadius: Math.min (width, height) * 0.5;
               verticalRadius: Math.min (width, height) * 0.5;
               anchors.fill: parent
               gradient: Gradient {
                  GradientStop { position: 0.00; color: "#BBaa1ed1"; }
                  GradientStop { position: 0.42; color: "#BB3694a2"; }
                  GradientStop { position: 1.00; color: "#00ffffff"; }
               }
            }
         }
      }
   }


   PathView {
      id: view

      anchors.leftMargin: 0
      anchors.topMargin: 0
      width: appWin.width
      height: appWin.height
      model: 200

      delegate: comp1
      path: Path {
         startX: view.width/2; startY: view.height*0.75
         PathQuad {
            x: view.width/2
            y: view.height/4
            controlX: view.width
            controlY: view.height*0.75
         }
         PathQuad {
            id: pQuad
            x: view.width/2
            y: view.height*0.75
            controlX: 0
            controlY: view.height*0.75
         }
      }
      MouseArea{
         anchors.fill: parent;
         onMouseXChanged: {
            view.path.startX = mouseX;
         }
         onMouseYChanged: {
            view.path.startY = mouseY;
         }

         onWheel:
         {
            if( wheel.angleDelta.y > 0 )
               view.incrementCurrentIndex();
            else
               view.decrementCurrentIndex();
         }
      }
   }
}

