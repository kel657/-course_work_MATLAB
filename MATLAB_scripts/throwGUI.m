function varargout = throwGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @throwGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @throwGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
function throwGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

function varargout = throwGUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function  read_data(handles)
global V alpha
V = str2double(get(handles.edit1,'String'));
alpha = str2double(get(handles.edit2,'String'));
function pushbutton1_Callback(hObject, eventdata, handles)
global V alpha
read_data(handles);
%V=20.0;
%alpha=35;
g=9.8; %гравитационна¤ посто¤нна¤
alpha = alpha * pi /180.0; %градусы в радианы
t=0;
i=1;
%расчтаем положение координат тела до достижени¤ максимальной высоты
while (t <= (V*sin(alpha) / g))
		x1(i) = V*cos(alpha)*t;
		y1(i) = V*sin(alpha)*t - g*t*t / 2;
		t =t+ 0.01;
        i=i+1;
end
h=y1(end);
hmax=h;
l=x1(end);
t = 0;
i=1;
%расчтаем положение координат тела после достижени¤ максимальной высоты
while (t <= (V*sin(alpha) / g))
	x2(i) = l + V*cos(alpha)*t;
	y2(i) = h - g*t*t / 2;
    i=i+1;
	t =t+ 0.01;
end
% построим график функций (x1, y1,x2,y2) задав цвет лини¤м,
% указав параметр 'r' после объ¤влени¤ абсцис и ординат.
plot(x1, y1,'r',x2,y2,'r'); 
%установим надпись возле оси х
xlabel('[m]') 
%установим надпись возле оси у
ylabel('[m]')