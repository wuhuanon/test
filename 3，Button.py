import tkinter
def func():
    print("hello world")
#创建住窗口
win = tkinter.Tk()
#设置标题
win.title("吴")
#设置大小和位置
win.geometry("400x400+200+0")


#进入消息循环
button = tkinter.Button(win, text="按钮", command=func, width=5, height=5)
button.pack()

button1 = tkinter.Button(win, text="按钮", command=lambda: print("1"))#command=win.puit
button1.pack()




win.mainloop()
