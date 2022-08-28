function varargout = yes_sir(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yes_sir_OpeningFcn, ...
                   'gui_OutputFcn',  @yes_sir_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before yes_sir is made visible.
function yes_sir_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to yes_sir (see VARARGIN)

% Choose default command line output for yes_sir
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes yes_sir wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = yes_sir_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global cls

[file,path] = uigetfile('*.csv')
%Value = get(handles.pushbutton1,'String')
set(handles.text2,'String',file)
cls = strcat(path,file)


function pushbutton2_Callback(hObject, eventdata, handles)
global att

[file2,path2] = uigetfile('*.csv')
%Value = get(handles.pushbutton2,'String')
set(handles.text4,'String',file2)
att = strcat(path2,file2)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global att cls
a = readtable(cls);
%Value = get(handles.edit1,'String')

Name = a.NAME;
Roll = a.Roll;
Pres = readtable(att);
name =Pres.NAME;

Lc=length(Name);
%Lp= length(name);
d=ismember(Name,name);
d=d';

j=0;
k = 0;
n=1;
m=1;
for i=1:Lc
    if d(i) == 1
        j(n) = Roll(i);
        n=n+1;
    elseif d(i) ==0
        k(m) = Roll(i);
        m=m+1;
    end

end

j=unique(j)
k=unique(k)
p=length(j)
a =length(k)
j = mat2str(j)
k = mat2str(k)
set(handles.edit1,'String',j)
set(handles.edit2,'String',k)
set(handles.text11,'String',p)
set(handles.text12,'String',a)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
empty = ' ',
set(handles.text2,'String',empty)
set(handles.text4,'String',empty)
set(handles.edit1,'String',empty)
set(handles.edit2,'String',empty)
set(handles.text11,'String',empty)
set(handles.text12,'String',empty)
% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function guide_Callback(hObject, eventdata, handles)
% hObject    handle to guide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help = 'Refer the _guide yes sir.txt_ file present in the downloading folder'
warndlg(help,'guide','modal')

% --------------------------------------------------------------------
function credit_Callback(hObject, eventdata, handles)
% hObject    handle to credit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = 'Abhishek Kumar\n2019UGPI049\nNIT JAMSHEDPUR\nsm.abhishek34@gmail.com'
str = compose(str)
warndlg(str,'credits')


% --- Executes on button press in pushbutton5.




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
