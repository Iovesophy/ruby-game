# -*- encoding: UTF-8 -*-
#!ruby -Ks

#まずPhiを調べてみたところどうやらwindows用のruby実行のライブラリのようで自分の環境では使えないよう、、
#さてどうしたものか笑

#この問題の解決はlinux上でapploを動かせるライブラリの検索である。
#どうやらLinuxでapolloの使用は断念すべきようだ
#それらしい情報ソースがない

#もうひとつの解決方法としてwindowsを利用してしまうというのが根本的な解決方法となる。

 
require 'phi'
include Phi
require 'dialogs'
require 'win32ole' 
require 'jpeg'

F = Form.new
F.caption="apllo課題"
F.width =  F.height = g = 500 

Tb = ToolBar.new F 
Cb=ComboBox.new Tb
Cb.width=50
Label.new(Tb,:l,'　ペンの太さ ')
3.times{|k| eval(%Q!@b#{k} = Button.new Tb;
  @b#{k}.caption=%w(読み込み 保存 ペンの色)[k-1]!)} 

Im = Image.new F ; Im.align = AL_CLIENT  

Cb.on_change = proc{         } 
Jm = Image.new 
Im.canvas.copy_mode=CM_SRC_AND

####マウスドラッグ（線描画）用フラグ
mflag = 0

Im.on_mouse_down = proc{|*s| Im.canvas.move_to(s[3],s[4])}  
Im.on_mouse_up = proc{               } 
Im.on_mouse_move = proc{|*s| 
    Im.canvas.line_to(s[2],s[3])
}
##mflag=1のみで描くように

@b0.on_click = proc{ 
  begin 
    c = ColorDialog.new 


  rescue 
  end 
} 

@b1.on_click =$yomikomi=proc{ o =OpenDialog.new 
  o.filter="jpeg・bmp画像|*.jpg;*.bmp|すべて|*.*|" 
  o.default_ext="jpg" 
  if o.execute then 
    if o.file_name.downcase.index('.jp')!=nil 
        k=Jpeg.new; k.load(o.file_name) 
        Im.picture.bitmap.assign(k) 
    else 
        Im.picture.load(o.file_name) 
    end 
  end 
}  
@b2.on_click = proc{   
  k=Jpeg.new 
  k.assign(Im.picture.bitmap)
  k.save(WIN32OLE.new("WScript.Shell").SpecialFolders("Desktop")+'\myimage.jpg')
} 
F.on_close_query = proc{ 
 mes = message_dlg '終了?(OK) 　戻る(キャンセル) ', 3, [2,3] 
 if mes==2 then false end
}
F.on_drop_files = proc {|sender, *files|
  files.each {|s|
    if s.downcase.index('.jp') != nil
       k = Jpeg.new
       k.load(s)  
       Jm.picture.bitmap.assign(k)
    else                              
       Jm.picture.load(s)
    end
    Im.canvas.copy_rect(Rect.new(0,0,g,g),Jm.canvas,Rect.new(0,0,g,g))
  }
}
F.popup_menu= pp = PopupMenu.new(F,:pop,'')

F.show

mainloop

