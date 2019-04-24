function varargout = Random_model(varargin)
% RANDOM_MODEL MATLAB code for Random_model.fig
%      RANDOM_MODEL, by itself, creates a new RANDOM_MODEL or raises the existing
%      singleton*.
%
%      H = RANDOM_MODEL returns the handle to a new RANDOM_MODEL or the handle to
%      the existing singleton*.
%
%      RANDOM_MODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RANDOM_MODEL.M with the given input arguments.
%
%      RANDOM_MODEL('Property','Value',...) creates a new RANDOM_MODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Random_model_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Random_model_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Random_model

% Last Modified by GUIDE v2.5 12-Apr-2017 11:18:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Random_model_OpeningFcn, ...
                   'gui_OutputFcn',  @Random_model_OutputFcn, ...
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


% --- Executes just before Random_model is made visible.
function Random_model_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Random_model (see VARARGIN)

% Choose default command line output for Random_model
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Random_model wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Random_model_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_dim_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dim_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dim_n as text
%        str2double(get(hObject,'String')) returns contents of edit_dim_n as a double


% --- Executes during object creation, after setting all properties.
function edit_dim_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dim_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_dim_ni_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dim_ni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dim_ni as text
%        str2double(get(hObject,'String')) returns contents of edit_dim_ni as a double


% --- Executes during object creation, after setting all properties.
function edit_dim_ni_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dim_ni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_dim_no_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dim_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dim_no as text
%        str2double(get(hObject,'String')) returns contents of edit_dim_no as a double


% --- Executes during object creation, after setting all properties.
function edit_dim_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dim_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_method.
function popupmenu_method_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_method


% --- Executes during object creation, after setting all properties.
function popupmenu_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_dim_n,'Value',3);
set(handles.edit_dim_no,'Value',1);
set(handles.edit_dim_ni,'Value',1);
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
order = [get(handles.edit_dim_n,'Value') get(handles.edit_dim_ni,'Value') get(handles.edit_dim_no,'Value') get(handles.popupmenu_method,'Value')];
d_range = [str2double(get(handles.edit_deltamin,'String')) str2double(get(handles.edit_deltamax,'String'))];
sys = [get(handles.checkbox_A,'Value') get(handles.checkbox_B,'Value') get(handles.checkbox_C,'Value') get(handles.checkbox_D,'Value')];
if d_range(1)>= d_range(2)
    errordlg('Please enter vailable range of delta','Error');
else
    if sum(sys) == 0
        errordlg('Please choose at least one system parameter','Error');
    else
        if isempty(get(handles.edit_samplesize,'String'))
        errordlg('Please set sample size.','Error');
        else
        load('fileData.mat');
        f_parameter.Dpmodel = [[order;sys] d_range'];
        f_parameter.Sample_Size = str2double(get(handles.edit_samplesize,'String'));
        save ('fileData','f_parameter');
        close;
        end
    end
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
text('Interpreter','latex','Units','Normalized','String',... 
    '$$x(k)   = Ax(k) + Bu(k)$$',...
    'Position',[.21 .73],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$y(k) = Cx(k) + Du(k)$$',...
    'Position',[.21 .66],'FontSize',12,'Fontname','MS Sans Serif')
text('Units','Normalized','String',... 
    'where',...
    'Position',[.135 .59],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$ A \in {R^{n \times n}}$$',...
    'Position',[.21 .55],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$B \in {R^{n \times {n_i}}}$$',...
    'Position',[.39 .55],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$C \in {R^{{n_0} \times n}}$$',...
    'Position',[.21 .5],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$D \in {R^{{n_0} \times {n_i}}}$$',...
    'Position',[.39 .5],'FontSize',12,'Fontname','MS Sans Serif')
%system order
text('Interpreter','latex','Units','Normalized','String',... 
    '$$n$$:',...
    'Position',[.75 .73],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$${n_i}$$:',...
    'Position',[.741 .651],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$${n_o}$$:',...
    'Position',[.745 .574],'FontSize',12,'Fontname','MS Sans Serif')
%uncertainty delta
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\Delta$$:',...
    'Position',[.3 .136],'FontSize',12,'Fontname','MS Sans Serif')



function edit_deltamin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_deltamin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_deltamin as text
%        str2double(get(hObject,'String')) returns contents of edit_deltamin as a double


% --- Executes during object creation, after setting all properties.
function edit_deltamin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_deltamin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_deltamax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_deltamax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_deltamax as text
%        str2double(get(hObject,'String')) returns contents of edit_deltamax as a double


% --- Executes during object creation, after setting all properties.
function edit_deltamax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_deltamax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_deltamin,'String',num2str(-10));
set(handles.edit_deltamax,'String',num2str(10));


% --- Executes on button press in checkbox_A.
function checkbox_A_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_A
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Dpmodel(2,1:4)) == 3
        errordlg('Maximal 3 can be chosen','Error');
        set(hObject,'Value',0);
    else
    f_parameter.Dpmodel(2,1) = 1;
    end
else
    f_parameter.Dpmodel(2,1) = 0;
end
save ('fileData','f_parameter');

% --- Executes on button press in checkbox_B.
function checkbox_B_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_B
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Dpmodel(2,1:4)) == 3
        errordlg('Maximal 3 can be chosen','Error');
        set(hObject,'Value',0);
    else
    f_parameter.Dpmodel(2,2) = 1;
    end
else
    f_parameter.Dpmodel(2,2) = 0;
end
save ('fileData','f_parameter');

% --- Executes on button press in checkbox_C.
function checkbox_C_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_C
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Dpmodel(2,1:4)) == 3
        errordlg('Maximal 3 can be chosen','Error');
        set(hObject,'Value',0);
    else
    f_parameter.Dpmodel(2,3) = 1;
    end
else
    f_parameter.Dpmodel(2,3) = 0;
end
save ('fileData','f_parameter');

% --- Executes on button press in checkbox_D.
function checkbox_D_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_D
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Dpmodel(2,1:4)) == 3
        errordlg('Maximal 3 can be chosen','Error');
        set(hObject,'Value',0);
    else
    f_parameter.Dpmodel(2,4) = 1;
    end
else
    f_parameter.Dpmodel(2,4) = 0;
end
save ('fileData','f_parameter');


% --- Executes on selection change in popup_siglvl.
function popup_siglvl_Callback(hObject, eventdata, handles)
% hObject    handle to popup_siglvl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_siglvl contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_siglvl


% --- Executes during object creation, after setting all properties.
function popup_siglvl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_siglvl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_accuracy.
function popup_accuracy_Callback(hObject, eventdata, handles)
% hObject    handle to popup_accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_accuracy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_accuracy


% --- Executes during object creation, after setting all properties.
function popup_accuracy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_samplesize_Callback(hObject, eventdata, handles)
% hObject    handle to edit_samplesize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_samplesize as text
%        str2double(get(hObject,'String')) returns contents of edit_samplesize as a double


% --- Executes during object creation, after setting all properties.
function edit_samplesize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_samplesize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.popup_siglvl,'Value')
    case 1
     Significancelvl = 0.01;
    case 2
     Significancelvl = 0.02;
    case 3
        Significancelvl = 0.03;
    case 4
        Significancelvl = 0.04;
    case 5
        Significancelvl = 0.05;
    case 6
        Significancelvl = 0.1;
end

switch get(handles.popup_accuracy,'Value')
    case 1
     Accuracy = 0.01;
    case 2
     Accuracy = 0.02;
    case 3
        Accuracy = 0.03;
    case 4
        Accuracy = 0.04;
    case 5
        Accuracy = 0.05;
    case 6
        Accuracy = 0.1;
end

sample_size = chernoff(Significancelvl,Accuracy,2);
set(handles.edit_samplesize,'String',num2str(sample_size));
