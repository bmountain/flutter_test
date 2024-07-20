import cv2

# 顔検出モデルの読み込み
faceDetect=cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
#faceDetect = cv2.dnn.readNetFromONNX('face_detection_yunet_2023mar.onnx')

# カメラから画像を取得して顔を囲う枠を上書きするクラス
class Video(object):
    def __init__(self): 
        # デフォルトのカメラを取得．
        self.video=cv2.VideoCapture(0)
    def __del__(self):
        # カメラを閉じる
        self.video.release()
    def get_frame(self):
        # カメラから画像データを取得．ret (boolean): 取得の成否，frame: 画像を表現するndarray (行数x列数x3色)
        ret,frame=self.video.read()
        # 検出された顔のリストを取得．各顔はx (左下のx座標)，y (左下のy座標), w (幅), h (高さ)で表現される
        faces=faceDetect.detectMultiScale(frame, minSize = (50, 50))
        # すべての顔の枠を付ける
        for x,y,w,h in faces:
            # 右上の頂点を計算
            x1, y1 =x+w, y+h
            # 枠を画像に書き込む．パラメタ：画像，二つの頂点，色，太さ
            cv2.rectangle(frame, (x,y), (x1, y1), (192,192,192), 2)
        # 画像をメモリバッファに書き込む
        ret,jpg=cv2.imencode('.jpg',frame)
        # 画像(ndarray)をbyteに変換
        return jpg.tobytes()