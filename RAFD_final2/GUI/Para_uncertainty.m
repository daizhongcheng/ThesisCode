function varargout = Para_uncertainty(varargin)
% PARA_UNCERTAINTY MATLAB code for Para_uncertainty.fig
%      PARA_UNCERTAINTY, by itself, creates a new PARA_UNCERTAINTY or raises the existing
%      singleton*.
%
%      H = PARA_UNCERTAINTY returns the handle to a new PARA_UNCERTAINTY or the handle to
%      the existing singleton*.
%
%      PARA_UNCERTAINTY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARA_UNCERTAINTY.M with the given input arguments.
%
%      PARA_UNCERTAINTY('Property','Value',...) creates a new PARA_UNCERTAINTY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Para_uncertainty_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Para_uncertainty_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Para_uncertainty

% Last Modified by GUIDE v2.5 22-Jun-2017 10:24:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Para_uncertainty_OpeningFcn, ...
                   'gui_OutputFcn',  @Para_uncertainty_OutputFcn, ...
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


% --- Executes just before Para_uncertainty is made visible.
function Para_uncertainty_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Para_uncertainty (see VARARGIN)

% Choose default command line output for Para_uncertainty
handles.output = hObject;
load('fileData.mat');
f_parameter.Uncertainty{1} = zeros(1,6);
save ('fileData','f_parameter'); 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Para_uncertainty wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Para_uncertainty_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
text('Interpreter','latex','Units','Normalized','String',... 
    '$$x(k + 1) = Ax(k) + Bu(k) + {E_d}d(k)$$',...
    'Position',[.25 .75],'FontSize',12,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$y(k) = Cx(k) + Du(k) + F_{d}d(k)$$',...
    'Position',[.3 .29],'FontSize',12,'Fontname','MS Sans Serif')

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
Uncertainty;
handles=guihandles;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);

% --- Executes on button press in checkbox_A.
function checkbox_A_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_A
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1})==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_A,'Enable','On');
        f_parameter.Uncertainty{1}(1) = 1;
    end
else
    f_parameter.Uncertainty{1}(1) = 0;
    set(handles.push_A,'Enable','Off');
    set(handles.text_A,'Visible','Off');
    f_parameter.Uncertainty{2}(1) = 0;
    f_parameter.Uncertainty{3} = zeros(3,6);
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
    if sum(f_parameter.Uncertainty{1})==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_B,'Enable','On');
        f_parameter.Uncertainty{1}(2) = 1;
    end
else
    f_parameter.Uncertainty{1}(2) = 0;
    set(handles.push_B,'Enable','Off');
    set(handles.text_B,'Visible','Off');
    f_parameter.Uncertainty{2}(2) = 0;
    f_parameter.Uncertainty{4} = zeros(3,6);
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
    if sum(f_parameter.Uncertainty{1})==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_C,'Enable','On');
        f_parameter.Uncertainty{1}(3) = 1;
    end
else
    f_parameter.Uncertainty{1}(3) = 0;
    set(handles.push_C,'Enable','Off');
    set(handles.text_C,'Visible','Off');
    f_parameter.Uncertainty{2}(3) = 0;
    f_parameter.Uncertainty{5} = zeros(3,6);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox_E.
function checkbox_E_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_E
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1})==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_E,'Enable','On');
        f_parameter.Uncertainty{1}(5) = 1;
    end
else
    f_parameter.Uncertainty{1}(5) = 0;
    set(handles.push_E,'Enable','Off');
    set(handles.text_E,'Visible','Off');
    f_parameter.Uncertainty{2}(5) = 0;
    f_parameter.Uncertainty{7} = zeros(3,6);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox_F.
function checkbox_F_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_F
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1})==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_F,'Enable','On');
        f_parameter.Uncertainty{1}(6) = 1;
    end
else
    f_parameter.Uncertainty{1}(6) = 0;
    set(handles.push_F,'Enable','Off');
    set(handles.text_F,'Visible','Off');
    f_parameter.Uncertainty{2}(6) = 0;
    f_parameter.Uncertainty{8} = zeros(3,6);
end
save ('fileData','f_parameter'); 

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in push_A.
function push_A_Callback(hObject, eventdata, handles)
% hObject    handle to push_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Para_mat
Para_mat = 1;
Para_matrix;
handles=guihandles;
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1);    
end

if dim_state > 3
   errordlg('Beyond dimension! Please use the polytopic uncertainty.','Error');
   set(handles.checkbox_load,'Value',0);
else
    switch dim_state
        case 1
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
        case 2
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
        case 3
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
            set(handles.edit35,'Enable','On');
            set(handles.edit36,'Enable','On');
    end
end


% --- Executes on button press in push_B.
function push_B_Callback(hObject, eventdata, handles)
% hObject    handle to push_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Para_mat
Para_mat = 2;
Para_matrix;
handles=guihandles;
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
   dim_input=f_parameter.Sys_dim(2);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1);   
   dim_input=size(c_parameter.Process_model{2},2);  
end

if dim_state > 3 || dim_input>3
   errordlg('Beyond dimension! Please use the polytopic uncertainty.','Error');
   set(handles.checkbox_load,'Value',0);
else
    
    set(handles.text11,'String','B11  ~ U [                ,                 ]');
    set(handles.text12,'String','B12  ~ U [                ,                 ]');
    set(handles.text13,'String','B13  ~ U [                ,                 ]');
    set(handles.text21,'String','B21  ~ U [                ,                 ]');
    set(handles.text22,'String','B22  ~ U [                ,                 ]');
    set(handles.text23,'String','B23  ~ U [                ,                 ]');
    set(handles.text31,'String','B31  ~ U [                ,                 ]');
    set(handles.text32,'String','B32  ~ U [                ,                 ]');
    set(handles.text33,'String','B33  ~ U [                ,                 ]');

    if [dim_state dim_input] == [1 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
    elseif [dim_state dim_input] == [1 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
    elseif [dim_state dim_input] == [1 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
    elseif [dim_state dim_input] == [2 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit22,'Enable','On');
    elseif [dim_state dim_input] == [2 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
    elseif [dim_state dim_input] == [2 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
    elseif [dim_state dim_input] == [3 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit32,'Enable','On');
    elseif [dim_state dim_input] == [3 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
    elseif [dim_state dim_input] == [3 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
            set(handles.edit35,'Enable','On');
            set(handles.edit36,'Enable','On');
    end
end

% --- Executes on button press in push_C.
function push_C_Callback(hObject, eventdata, handles)
% hObject    handle to push_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Para_mat
Para_mat = 3;
Para_matrix;
handles=guihandles;
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
   dim_output=f_parameter.Sys_dim(3);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1);   
   dim_output=size(c_parameter.Process_model{3},1);  
end

if dim_state > 3 || dim_output>3
   errordlg('Beyond dimension! Please use the polytopic uncertainty.','Error');
   set(handles.checkbox_load,'Value',0);
else
    set(handles.text11,'String','C11  ~ U [                ,                 ]');
    set(handles.text12,'String','C12  ~ U [                ,                 ]');
    set(handles.text13,'String','C13  ~ U [                ,                 ]');
    set(handles.text21,'String','C21  ~ U [                ,                 ]');
    set(handles.text22,'String','C22  ~ U [                ,                 ]');
    set(handles.text23,'String','C23  ~ U [                ,                 ]');
    set(handles.text31,'String','C31  ~ U [                ,                 ]');
    set(handles.text32,'String','C32  ~ U [                ,                 ]');
    set(handles.text33,'String','C33  ~ U [                ,                 ]');
    if      [dim_state dim_output] == [1 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
    elseif [dim_state dim_output] == [1 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit22,'Enable','On');
    elseif [dim_state dim_output] == [1 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit32,'Enable','On');
    elseif [dim_state dim_output] == [2 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
    elseif [dim_state dim_output] == [2 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
    elseif [dim_state dim_output] == [2 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
    elseif [dim_state dim_output] == [3 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
    elseif [dim_state dim_output] == [3 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
    elseif [dim_state dim_output] == [3 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
            set(handles.edit35,'Enable','On');
            set(handles.edit36,'Enable','On');

    end
end

% --- Executes on button press in push_E.
function push_E_Callback(hObject, eventdata, handles)
% hObject    handle to push_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Para_mat
Para_mat = 5;
Para_matrix;
handles=guihandles;
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_state=f_parameter.Sys_dim(1);
   dim_disturbance=f_parameter.Sys_dim(4);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_state=size(c_parameter.Process_model{1},1);  
   if isempty(c_parameter.Process_model{5})==1 % if Ed is empty
      errordlg('There is no ''Ed'' matrix','Error');
      set(handles.checkbox_load,'Value',0);
   else
      dim_disturbance=size(c_parameter.Process_model{5},2);  
   end
end

if dim_state > 3 || dim_disturbance>3
   errordlg('Beyond dimension! Please use the polytopic uncertainty.','Error');
   set(handles.checkbox_load,'Value',0);
else
    % string
    set(handles.text11,'String','Ed11  ~ U [                ,                 ]');
    set(handles.text12,'String','Ed12  ~ U [                ,                 ]');
    set(handles.text13,'String','Ed13  ~ U [                ,                 ]');
    set(handles.text21,'String','Ed21  ~ U [                ,                 ]');
    set(handles.text22,'String','Ed22  ~ U [                ,                 ]');
    set(handles.text23,'String','Ed23  ~ U [                ,                 ]');
    set(handles.text31,'String','Ed31  ~ U [                ,                 ]');
    set(handles.text32,'String','Ed32  ~ U [                ,                 ]');
    set(handles.text33,'String','Ed33  ~ U [                ,                 ]');
    % position
    set(handles.text11,'Position',[7 15.461538461538467 44 2]);
    set(handles.text12,'Position',[56 15.461538461538467 44 2]);
    set(handles.text13,'Position',[106.2 15.461538461538467 44 2]);
    set(handles.text21,'Position',[7 11.461538461538467 44 2]);
    set(handles.text22,'Position',[56 11.461538461538467 44 2]);
    set(handles.text23,'Position',[106.2 11.461538461538467 44 2]);
    set(handles.text31,'Position',[7 7.461538461538465 44 2]);
    set(handles.text32,'Position',[56 7.461538461538465 44 2]);
    set(handles.text33,'Position',[106.2 7.461538461538465 44 2]);  
    % enable
    if [dim_state dim_disturbance] == [1 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
    elseif [dim_state dim_disturbance] == [1 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
    elseif [dim_state dim_disturbance] == [1 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
    elseif [dim_state dim_disturbance] == [2 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit22,'Enable','On');
    elseif [dim_state dim_disturbance] == [2 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
    elseif [dim_state dim_disturbance] == [2 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
    elseif [dim_state dim_disturbance] == [3 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
    elseif [dim_state dim_disturbance] == [3 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
    elseif [dim_state dim_disturbance] == [3 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');   
            set(handles.edit35,'Enable','On');
            set(handles.edit36,'Enable','On');
    end
end

% --- Executes on button press in push_F.
function push_F_Callback(hObject, eventdata, handles)
% hObject    handle to push_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Para_mat
Para_mat = 6;
Para_matrix;
handles=guihandles;
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_output=f_parameter.Sys_dim(3);
   dim_disturbance=f_parameter.Sys_dim(4);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
   dim_output=size(c_parameter.Process_model{3},1);  
   if (isempty(c_parameter.Process_model{5}) & isempty(c_parameter.Process_model{6}))==1 % if Ed and Fd is empty
      errordlg('There is no disturbance matrix','Error');
      set(handles.checkbox_load,'Value',0);
   elseif isempty(c_parameter.Process_model{6})==1 % if Fd is empty
      errordlg('There is no ''Fd'' matrix','Error');
      set(handles.checkbox_load,'Value',0); 
   else
      dim_disturbance=size(c_parameter.Process_model{5},2);  
   end
end

if dim_output > 3 || dim_disturbance>3
   errordlg('Beyond dimension! Please use the polytopic uncertainty.','Error');
   set(handles.checkbox_load,'Value',0);
else
    % string
    set(handles.text11,'String','Fd11  ~ U [                ,                 ]');
    set(handles.text12,'String','Fd12  ~ U [                ,                 ]');
    set(handles.text13,'String','Fd13  ~ U [                ,                 ]');
    set(handles.text21,'String','Fd21  ~ U [                ,                 ]');
    set(handles.text22,'String','Fd22  ~ U [                ,                 ]');
    set(handles.text23,'String','Fd23  ~ U [                ,                 ]');
    set(handles.text31,'String','Fd31  ~ U [                ,                 ]');
    set(handles.text32,'String','Fd32  ~ U [                ,                 ]');
    set(handles.text33,'String','Fd33  ~ U [                ,                 ]');
    % position
    set(handles.text11,'Position',[7 15.461538461538467 44 2]);
    set(handles.text12,'Position',[56 15.461538461538467 44 2]);
    set(handles.text13,'Position',[106.2 15.461538461538467 44 2]);
    set(handles.text21,'Position',[7 11.461538461538467 44 2]);
    set(handles.text22,'Position',[56 11.461538461538467 44 2]);
    set(handles.text23,'Position',[106.2 11.461538461538467 44 2]);
    set(handles.text31,'Position',[7 7.461538461538465 44 2]);
    set(handles.text32,'Position',[56 7.461538461538465 44 2]);
    set(handles.text33,'Position',[106.2 7.461538461538465 44 2]);  
    % enable
    if [dim_output dim_disturbance] == [1 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
    elseif [dim_output dim_disturbance] == [1 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
    elseif [dim_output dim_disturbance] == [1 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
    elseif [dim_output dim_disturbance] == [2 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit22,'Enable','On');
    elseif [dim_output dim_disturbance] == [2 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
    elseif [dim_output dim_disturbance] == [2 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
    elseif [dim_output dim_disturbance] == [3 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
    elseif [dim_output dim_disturbance] == [3 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
    elseif [dim_output dim_disturbance] == [3 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
            set(handles.edit35,'Enable','On');
            set(handles.edit36,'Enable','On');

    end
end


% --- Executes on button press in push_D.
function push_D_Callback(hObject, eventdata, handles)
% hObject    handle to push_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Para_mat
Para_mat = 4;
Para_matrix;
handles=guihandles;
load('fileData.mat');

load('customData.mat');
% if the custom use GUI to generate system model
if c_parameter.Choice(1,2)==1 
   dim_output=f_parameter.Sys_dim(3);
   dim_input=f_parameter.Sys_dim(2);
% if the custom load system model    
elseif c_parameter.Choice(1,1)==1
    
   if isempty(c_parameter.Process_model{4})==1 % if D is empty
      errordlg('There is no ''D'' matrix','Error');
      set(handles.checkbox_load,'Value',0);
   else
      dim_output=size(c_parameter.Process_model{3},1); 
      dim_input=size(c_parameter.Process_model{2},2);  
   end
end

if dim_output > 3 || dim_input>3
   errordlg('Beyond dimension! Please use the polytopic uncertainty.','Error');
   set(handles.checkbox_load,'Value',0);
else
    % string
    set(handles.text11,'String','D11  ~ U [                ,                 ]');
    set(handles.text12,'String','D12  ~ U [                ,                 ]');
    set(handles.text13,'String','D13  ~ U [                ,                 ]');
    set(handles.text21,'String','D21  ~ U [                ,                 ]');
    set(handles.text22,'String','D22  ~ U [                ,                 ]');
    set(handles.text23,'String','D23  ~ U [                ,                 ]');
    set(handles.text31,'String','D31  ~ U [                ,                 ]');
    set(handles.text32,'String','D32  ~ U [                ,                 ]');
    set(handles.text33,'String','D33  ~ U [                ,                 ]');
    
    % enable
    if [dim_output dim_input] == [1 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
    elseif [dim_output dim_input] == [1 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
    elseif [dim_output dim_input] == [1 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
    elseif [dim_output dim_input] == [2 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit22,'Enable','On');
    elseif [dim_output dim_input] == [2 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
    elseif [dim_output dim_input] == [2 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
    elseif [dim_output dim_input] == [3 1]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
    elseif [dim_output dim_input] == [3 2]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
    elseif [dim_output dim_input] == [3 3]
            set(handles.edit11,'Enable','On');
            set(handles.edit12,'Enable','On');
            set(handles.edit13,'Enable','On');
            set(handles.edit14,'Enable','On');
            set(handles.edit15,'Enable','On');
            set(handles.edit16,'Enable','On');
            set(handles.edit21,'Enable','On');
            set(handles.edit22,'Enable','On');
            set(handles.edit23,'Enable','On');
            set(handles.edit24,'Enable','On');
            set(handles.edit25,'Enable','On');
            set(handles.edit26,'Enable','On');
            set(handles.edit31,'Enable','On');
            set(handles.edit32,'Enable','On');
            set(handles.edit33,'Enable','On');
            set(handles.edit34,'Enable','On');
            set(handles.edit35,'Enable','On');
            set(handles.edit36,'Enable','On');

    end
end

% --- Executes on button press in checkbox_D.
function checkbox_D_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_D
load('fileData.mat');
if get(hObject,'Value') == 1
    if sum(f_parameter.Uncertainty{1})==3
        errordlg('Maximum only 3 can be chosen .','Error');
        set(hObject,'Value',0);
    else
        set(handles.push_D,'Enable','On');
        f_parameter.Uncertainty{1}(4) = 1;
    end
else
    f_parameter.Uncertainty{1}(4) = 0;
    set(handles.push_D,'Enable','Off');
    set(handles.text_D,'Visible','Off');
    f_parameter.Uncertainty{2}(4) = 0;
    f_parameter.Uncertainty{6} = zeros(3,6);
end
save ('fileData','f_parameter'); 


% --- Executes during object creation, after setting all properties.
function text_A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
