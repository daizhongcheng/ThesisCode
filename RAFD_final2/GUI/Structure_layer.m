function varargout = Structure_layer(varargin)
% STRUCTURE_LAYER MATLAB code for Structure_layer.fig
%      STRUCTURE_LAYER, by itself, creates a new STRUCTURE_LAYER or raises the existing
%      singleton*.
%
%      H = STRUCTURE_LAYER returns the handle to a new STRUCTURE_LAYER or the handle to
%      the existing singleton*.
%
%      STRUCTURE_LAYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STRUCTURE_LAYER.M with the given input arguments.
%
%      STRUCTURE_LAYER('Property','Value',...) creates a new STRUCTURE_LAYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Structure_layer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Structure_layer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Structure_layer

% Last Modified by GUIDE v2.5 07-Mar-2017 15:33:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Structure_layer_OpeningFcn, ...
    'gui_OutputFcn',  @Structure_layer_OutputFcn, ...
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


% --- Executes just before Structure_layer is made visible.
function Structure_layer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Structure_layer (see VARARGIN)

% Choose default command line output for Structure_layer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Structure_layer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Structure_layer_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pop_fNr_Callback(hObject, eventdata, handles)
% hObject    handle to pop_fNr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pop_fNr as text
%        str2double(get(hObject,'String')) returns contents of pop_fNr as a double
global Fault_Number
fnum = get(hObject,'Value');
Fault_Number = fnum;
pnum = get(handles.pop_pNr,'Value');
switch fnum
    case 1
        load('fileData.mat');
        f_parameter.Fault_Pattern = zeros(5,3);
        save ('fileData','f_parameter');
        switch pnum
            case 1
            %enable s1-f1
            set(handles.checkbox11,'Enable','On');
            case 2
            %enable s1-f1, s2-f1
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            case 3
            %enable s1-f1, s2-f1, s3-f1
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            case 4
            %enable s1-f1, s2-f1, s3-f1, s4-f1
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox41,'Enable','On');
            case 5
            %enable s1-f1, s2-f1, s3-f1, s4-f1, s5-f1
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox41,'Enable','On');
            set(handles.checkbox51,'Enable','On');
        end
            %unable f2&f3
            set(handles.checkbox12,'Enable','Off');
            set(handles.checkbox13,'Enable','Off');
            set(handles.checkbox22,'Enable','Off');
            set(handles.checkbox23,'Enable','Off');
            set(handles.checkbox32,'Enable','Off');
            set(handles.checkbox33,'Enable','Off');
            set(handles.checkbox42,'Enable','Off');
            set(handles.checkbox43,'Enable','Off');
            set(handles.checkbox52,'Enable','Off');
            set(handles.checkbox53,'Enable','Off');
        %clear f1,f2&f3
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.text16,'String','');
        set(handles.text19,'String','');
        set(handles.text22,'String','');
        set(handles.text25,'String','');
        
        set(handles.edit_pr_1,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.edit_pr_5,'String','');
        
    case 2
        load('fileData.mat');
        f_parameter.Fault_Pattern = zeros(5,3);
        save ('fileData','f_parameter');
        switch pnum
            case 1
                %enable s1-f1&f2
                set(handles.checkbox11,'Enable','On');
                set(handles.checkbox12,'Enable','On');
            case 2
            %enable s1-f1&f2, s2-f1&f2
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            case 3
            %enable s1-f1&f2, s2-f1&f2, s3-f1&f2
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox32,'Enable','On');
            case 4
            %enable s1-f1&f2, s2-f1&f2, s3-f1&f2, s4-f1&f2
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox32,'Enable','On');
            set(handles.checkbox41,'Enable','On');
            set(handles.checkbox42,'Enable','On');
            case 5
            %enable s1-f1&f2, s2-f1&f2, s3-f1&f2, s4-f1&f2, s5-f1&f2
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox32,'Enable','On');
            set(handles.checkbox41,'Enable','On');
            set(handles.checkbox42,'Enable','On');
            set(handles.checkbox51,'Enable','On');
            set(handles.checkbox52,'Enable','On');
        end
        %unable f3
        set(handles.checkbox13,'Enable','Off');
        set(handles.checkbox23,'Enable','Off');
        set(handles.checkbox33,'Enable','Off');
        set(handles.checkbox43,'Enable','Off');
        set(handles.checkbox53,'Enable','Off');
        %clear f1,f2&f3
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.text16,'String','');
        set(handles.text19,'String','');
        set(handles.text22,'String','');
        set(handles.text25,'String','');
        
        set(handles.edit_pr_1,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.edit_pr_5,'String','');
    case 3
        load('fileData.mat');
        f_parameter.Fault_Pattern = zeros(5,3);
        save ('fileData','f_parameter');
        switch pnum
            case 1
            %enable s1-f1&f2&f3
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox13,'Enable','On');
            case 2
            %enable s1-f1&f2&f3, s2-f1&f2&f3
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox13,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            set(handles.checkbox23,'Enable','On');
            case 3
            %enable s1-f1&f2&f3, s2-f1&f2&f3, s3-f1&f2&f3
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox13,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            set(handles.checkbox23,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox32,'Enable','On');
            set(handles.checkbox33,'Enable','On');
            case 4
            %enable s1-f1&f2&f3, s2-f1&f2&f3, s3-f1&f2&f3, s4-f1&f2&f3
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox13,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            set(handles.checkbox23,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox32,'Enable','On');
            set(handles.checkbox33,'Enable','On');
            set(handles.checkbox41,'Enable','On');
            set(handles.checkbox42,'Enable','On');
            set(handles.checkbox43,'Enable','On');
            case 5
            %enable s1-f1&f2&f3, s2-f1&f2&f3, s3-f1&f2&f3, s4-f1&f2&f3,
            %s5-f1&f2&f3
            set(handles.checkbox11,'Enable','On');
            set(handles.checkbox12,'Enable','On');
            set(handles.checkbox13,'Enable','On');
            set(handles.checkbox21,'Enable','On');
            set(handles.checkbox22,'Enable','On');
            set(handles.checkbox23,'Enable','On');
            set(handles.checkbox31,'Enable','On');
            set(handles.checkbox32,'Enable','On');
            set(handles.checkbox33,'Enable','On');
            set(handles.checkbox41,'Enable','On');
            set(handles.checkbox42,'Enable','On');
            set(handles.checkbox43,'Enable','On');
            set(handles.checkbox51,'Enable','On');
            set(handles.checkbox52,'Enable','On');
            set(handles.checkbox53,'Enable','On');
        end
        %clear f1,f2&f3
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.text16,'String','');
        set(handles.text19,'String','');
        set(handles.text22,'String','');
        set(handles.text25,'String','');
        
        set(handles.edit_pr_1,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.edit_pr_5,'String','');
end
% --- Executes during object creation, after setting all properties.
function pop_fNr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_fNr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Fault_Number
Fault_Number = 1;
set(hObject,'Value',1);


function edit_faultcause_Callback(hObject, eventdata, handles)
% hObject    handle to edit_faultcause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_faultcause as text
%        str2double(get(hObject,'String')) returns contents of edit_faultcause as a double


% --- Executes during object creation, after setting all properties.
function edit_faultcause_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_faultcause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_close.
function pushbutton_close_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=questdlg('Do you want to close the toolbox?','Close','Yes','No','Yes');
if strcmp(c,'Yes')
    close all;
end

% --- Executes on button press in togglebutton_next.
function togglebutton_next_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_next
global Fault_Number Pattern_Nr FaultNr_now
handles=guihandles;

pr1 = get(handles.edit_pr_1,'String');
pr2 = get(handles.edit_pr_2,'String');
pr3 = get(handles.edit_pr_3,'String');
pr4 = get(handles.edit_pr_4,'String');
pr5 = get(handles.edit_pr_5,'String');
switch Pattern_Nr
    case 1
        pr1 = str2double(pr1);
    if (pr1<0)||(pr1>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr2 = 0;
        pr3 = 0;
        pr4 = 0;
        pr5 = 0;
    case 2
        pr1 = str2double(pr1);
    if (pr1<0)||(pr1>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr2 = str2double(pr2);
    if (pr2<0)||(pr2>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr3 = 0;
        pr4 = 0;
        pr5 = 0;
    case 3
        pr1 = str2double(pr1);
    if (pr1<0)||(pr1>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr2 = str2double(pr2);
    if (pr2<0)||(pr2>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr3 = str2double(pr3);
    if (pr3<0)||(pr3>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr4 = 0;
        pr5 = 0;
    case 4
        pr1 = str2double(pr1);
    if (pr1<0)||(pr1>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr2 = str2double(pr2);
    if (pr2<0)||(pr2>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr3 = str2double(pr3);
    if (pr3<0)||(pr3>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr4 = str2double(pr4);
    if (pr4<0)||(pr4>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr5 = 0;
    case 5
        pr1 = str2double(pr1);
    if (pr1<0)||(pr1>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr2 = str2double(pr2);
    if (pr2<0)||(pr2>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr3 = str2double(pr3);
    if (pr3<0)||(pr3>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr4 = str2double(pr4);
    if (pr4<0)||(pr4>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
        pr5 = str2double(pr5);
    if (pr5<0)||(pr5>100)
        errordlg('The probability should belong to [0,1].','Error');
    end
end
    
Pattern_pro = [pr1,pr2,pr3,pr4,pr5];
pr_sum = sum(Pattern_pro);
if pr_sum ==100
    load('fileData.mat');
    f_parameter.Pattern_pro = Pattern_pro;
    f_parameter.Hidden_pro(:,:,1) = zeros(3,3);
    f_parameter.Fault_Number = Fault_Number;
    f_parameter.Pattern_Nr = Pattern_Nr;
    save ('fileData','f_parameter');
    FaultNr_now = 1;
    close;    
% comes fault1
    Parameter_layer1;  
else
    errordlg('The sum of all probabilities should be 100.','Error');
end
    
    function pop_faultpattern_Callback(hObject, eventdata, handles)
    % hObject    handle to pop_faultpattern (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of pop_faultpattern as text
    %        str2double(get(hObject,'String')) returns contents of pop_faultpattern as a double
    
    
    % --- Executes during object creation, after setting all properties.
        function edit_faultpattern_CreateFcn(hObject, eventdata, handles)
            % hObject    handle to pop_faultpattern (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    empty - handles not created until after all CreateFcns called
            
            % Hint: edit controls usually have a white background on Windows.
            %       See ISPC and COMPUTER.
            if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
                set(hObject,'BackgroundColor','white');
            end


% --- Executes on button press in checkbox42.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox42


% --- Executes on button press in checkbox43.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox43


% --- Executes on button press in checkbox51.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox51


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(2,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(2,1) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(2,1) = 1;
    end
else
    f_parameter.Fault_Pattern(2,1) = 0;
end
set(handles.text16,'String',num2str(f_parameter.Fault_Pattern(2,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(2,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(2,2) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(2,2) = 1;
    end
else
    f_parameter.Fault_Pattern(2,2) = 0;
end
set(handles.text16,'String',num2str(f_parameter.Fault_Pattern(2,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(2,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(2,3) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(2,3) = 1;
    end
else
    f_parameter.Fault_Pattern(2,3) = 0;
end
set(handles.text16,'String',num2str(f_parameter.Fault_Pattern(2,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(3,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(3,1) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(3,1) = 1;
    end
else
    f_parameter.Fault_Pattern(3,1) = 0;
end
set(handles.text19,'String',num2str(f_parameter.Fault_Pattern(3,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox32.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox32
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(3,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(3,2) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(3,2) = 1;
    end
else
    f_parameter.Fault_Pattern(3,2) = 0;
end
set(handles.text19,'String',num2str(f_parameter.Fault_Pattern(3,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox33.
function checkbox33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox33
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(3,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(3,3) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(3,3) = 1;
    end
else
    f_parameter.Fault_Pattern(3,3) = 0;
end
set(handles.text19,'String',num2str(f_parameter.Fault_Pattern(3,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox41.
function checkbox41_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox41
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(4,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(4,1) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(4,1) = 1;
    end
else
    f_parameter.Fault_Pattern(4,1) = 0;
end
set(handles.text22,'String',num2str(f_parameter.Fault_Pattern(4,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox42.
function checkbox42_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox42
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(4,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(4,2) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(4,2) = 1;
    end
else
    f_parameter.Fault_Pattern(4,2) = 0;
end
set(handles.text22,'String',num2str(f_parameter.Fault_Pattern(4,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox43.
function checkbox43_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox43
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(4,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(4,3) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(4,3) = 1;
    end
else
    f_parameter.Fault_Pattern(4,3) = 0;
end
set(handles.text22,'String',num2str(f_parameter.Fault_Pattern(4,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox51.
function checkbox51_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox51
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(5,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(5,1) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(5,1) = 1;
    end
else
    f_parameter.Fault_Pattern(5,1) = 0;
end
set(handles.text25,'String',num2str(f_parameter.Fault_Pattern(5,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox52.
function checkbox52_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox52
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(5,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(5,2) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(5,2) = 1;
    end
else
    f_parameter.Fault_Pattern(5,2) = 0;
end
set(handles.text25,'String',num2str(f_parameter.Fault_Pattern(5,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox53.
function checkbox53_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox53
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(5,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(5,3) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(5,3) = 1;
    end
else
    f_parameter.Fault_Pattern(5,3) = 0;
end
set(handles.text25,'String',num2str(f_parameter.Fault_Pattern(5,:)));
save ('fileData','f_parameter');


function edit_pr_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_1 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_1 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'Enable','On');
set(hObject,'String',num2str(100));


function edit_pr_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_2 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_2 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pr_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_3 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_3 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pr_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_4 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_4 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pr_5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pr_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pr_5 as text
%        str2double(get(hObject,'String')) returns contents of edit_pr_5 as a double


% --- Executes during object creation, after setting all properties.
function edit_pr_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pr_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in pop_pNr.
function pop_pNr_Callback(hObject, eventdata, handles)
% hObject    handle to pop_pNr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_pNr contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_pNr
global Pattern_Nr
pnum = get(hObject,'Value');
Pattern_Nr = pnum;
load('fileData.mat');
f_parameter.Fault_Pattern = zeros(5,3);
save ('fileData','f_parameter');
switch pnum
    case 1
        %enable pattern s1
        set(handles.text_s1,'Enable','On');
        set(handles.checkbox11,'Enable','On');
        set(handles.checkbox12,'Enable','On');
        set(handles.checkbox13,'Enable','On');
        set(handles.text11,'Enable','On');
        set(handles.text12,'Enable','On');
        set(handles.text13,'Enable','On');
        set(handles.text27,'Enable','On');
        set(handles.edit_pr_1,'Enable','On');
        %unable pattern s2
        set(handles.text_s2,'Enable','Off');
        set(handles.checkbox21,'Enable','Off');
        set(handles.checkbox22,'Enable','Off');
        set(handles.checkbox23,'Enable','Off');
        set(handles.text15,'Enable','Off');
        set(handles.text16,'Enable','Off');
        set(handles.text17,'Enable','Off');
        set(handles.text28,'Enable','Off');
        set(handles.edit_pr_2,'Enable','Off');
        %unable pattern s3
        set(handles.text_s3,'Enable','Off');
        set(handles.checkbox31,'Enable','Off');
        set(handles.checkbox32,'Enable','Off');
        set(handles.checkbox33,'Enable','Off');
        set(handles.text18,'Enable','Off');
        set(handles.text19,'Enable','Off');
        set(handles.text20,'Enable','Off');
        set(handles.text29,'Enable','Off');
        set(handles.edit_pr_3,'Enable','Off');
        %unable pattern s4
        set(handles.text_s4,'Enable','Off');
        set(handles.checkbox41,'Enable','Off');
        set(handles.checkbox42,'Enable','Off');
        set(handles.checkbox43,'Enable','Off');
        set(handles.text21,'Enable','Off');
        set(handles.text22,'Enable','Off');
        set(handles.text23,'Enable','Off');
        set(handles.text30,'Enable','Off');
        set(handles.edit_pr_4,'Enable','Off');
        %unable pattern s5
        set(handles.text_s5,'Enable','Off');
        set(handles.checkbox51,'Enable','Off');
        set(handles.checkbox52,'Enable','Off');
        set(handles.checkbox53,'Enable','Off');
        set(handles.text24,'Enable','Off');
        set(handles.text25,'Enable','Off');
        set(handles.text26,'Enable','Off');
        set(handles.text31,'Enable','Off');
        set(handles.edit_pr_5,'Enable','Off');
        
        %clear s1,s2,s3,s4&s5
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.edit_pr_1,'String','');
        set(handles.text16,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.text19,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.text22,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.text25,'String','');
        set(handles.edit_pr_5,'String','');
    case 2
        %enable pattern s1
        set(handles.text_s1,'Enable','On');
        set(handles.checkbox11,'Enable','On');
        set(handles.checkbox12,'Enable','On');
        set(handles.checkbox13,'Enable','On');
        set(handles.text11,'Enable','On');
        set(handles.text12,'Enable','On');
        set(handles.text13,'Enable','On');
        set(handles.text27,'Enable','On');
        set(handles.edit_pr_1,'Enable','On');
        %enable pattern s2
        set(handles.text_s2,'Enable','On');
        set(handles.checkbox21,'Enable','On');
        set(handles.checkbox22,'Enable','On');
        set(handles.checkbox23,'Enable','On');
        set(handles.text15,'Enable','On');
        set(handles.text16,'Enable','On');
        set(handles.text17,'Enable','On');
        set(handles.text28,'Enable','On');
        set(handles.edit_pr_2,'Enable','On');
        %unable pattern s3
        set(handles.text_s3,'Enable','Off');
        set(handles.checkbox31,'Enable','Off');
        set(handles.checkbox32,'Enable','Off');
        set(handles.checkbox33,'Enable','Off');
        set(handles.text18,'Enable','Off');
        set(handles.text19,'Enable','Off');
        set(handles.text20,'Enable','Off');
        set(handles.text29,'Enable','Off');
        set(handles.edit_pr_3,'Enable','Off');
        %unable pattern s4
        set(handles.text_s4,'Enable','Off');
        set(handles.checkbox41,'Enable','Off');
        set(handles.checkbox42,'Enable','Off');
        set(handles.checkbox43,'Enable','Off');
        set(handles.text21,'Enable','Off');
        set(handles.text22,'Enable','Off');
        set(handles.text23,'Enable','Off');
        set(handles.text30,'Enable','Off');
        set(handles.edit_pr_4,'Enable','Off');
        %unable pattern s5
        set(handles.text_s5,'Enable','Off');
        set(handles.checkbox51,'Enable','Off');
        set(handles.checkbox52,'Enable','Off');
        set(handles.checkbox53,'Enable','Off');
        set(handles.text24,'Enable','Off');
        set(handles.text25,'Enable','Off');
        set(handles.text26,'Enable','Off');
        set(handles.text31,'Enable','Off');
        set(handles.edit_pr_5,'Enable','Off');
        
        %clear s1,s2,s3,s4&s5
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.edit_pr_1,'String','');
        set(handles.text16,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.text19,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.text22,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.text25,'String','');
        set(handles.edit_pr_5,'String','');
    case 3
        %enable pattern s1
        set(handles.text_s1,'Enable','On');
        set(handles.checkbox11,'Enable','On');
        set(handles.checkbox12,'Enable','On');
        set(handles.checkbox13,'Enable','On');
        set(handles.text11,'Enable','On');
        set(handles.text12,'Enable','On');
        set(handles.text13,'Enable','On');
        set(handles.text27,'Enable','On');
        set(handles.edit_pr_1,'Enable','On');
        %enable pattern s2
        set(handles.text_s2,'Enable','On');
        set(handles.checkbox21,'Enable','On');
        set(handles.checkbox22,'Enable','On');
        set(handles.checkbox23,'Enable','On');
        set(handles.text15,'Enable','On');
        set(handles.text16,'Enable','On');
        set(handles.text17,'Enable','On');
        set(handles.text28,'Enable','On');
        set(handles.edit_pr_2,'Enable','On');
        %enable pattern s3
        set(handles.text_s3,'Enable','On');
        set(handles.checkbox31,'Enable','On');
        set(handles.checkbox32,'Enable','On');
        set(handles.checkbox33,'Enable','On');
        set(handles.text18,'Enable','On');
        set(handles.text19,'Enable','On');
        set(handles.text20,'Enable','On');
        set(handles.text29,'Enable','On');
        set(handles.edit_pr_3,'Enable','On');
        %unable pattern s4
        set(handles.text_s4,'Enable','Off');
        set(handles.checkbox41,'Enable','Off');
        set(handles.checkbox42,'Enable','Off');
        set(handles.checkbox43,'Enable','Off');
        set(handles.text21,'Enable','Off');
        set(handles.text22,'Enable','Off');
        set(handles.text23,'Enable','Off');
        set(handles.text30,'Enable','Off');
        set(handles.edit_pr_4,'Enable','Off');
        %unable pattern s5
        set(handles.text_s5,'Enable','Off');
        set(handles.checkbox51,'Enable','Off');
        set(handles.checkbox52,'Enable','Off');
        set(handles.checkbox53,'Enable','Off');
        set(handles.text24,'Enable','Off');
        set(handles.text25,'Enable','Off');
        set(handles.text26,'Enable','Off');
        set(handles.text31,'Enable','Off');
        set(handles.edit_pr_5,'Enable','Off');
        
        %clear s1,s2,s3,s4&s5
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.edit_pr_1,'String','');
        set(handles.text16,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.text19,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.text22,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.text25,'String','');
        set(handles.edit_pr_5,'String','');
    case 4
        %enable pattern s1
        set(handles.text_s1,'Enable','On');
        set(handles.checkbox11,'Enable','On');
        set(handles.checkbox12,'Enable','On');
        set(handles.checkbox13,'Enable','On');
        set(handles.text11,'Enable','On');
        set(handles.text12,'Enable','On');
        set(handles.text13,'Enable','On');
        set(handles.text11,'Enable','On');
        set(handles.edit_pr_1,'Enable','On');
        %enable pattern s2
        set(handles.text_s2,'Enable','On');
        set(handles.checkbox21,'Enable','On');
        set(handles.checkbox22,'Enable','On');
        set(handles.checkbox23,'Enable','On');
        set(handles.text15,'Enable','On');
        set(handles.text16,'Enable','On');
        set(handles.text17,'Enable','On');
        set(handles.text28,'Enable','On');
        set(handles.edit_pr_2,'Enable','On');
        %enable pattern s3
        set(handles.text_s3,'Enable','On');
        set(handles.checkbox31,'Enable','On');
        set(handles.checkbox32,'Enable','On');
        set(handles.checkbox33,'Enable','On');
        set(handles.text18,'Enable','On');
        set(handles.text19,'Enable','On');
        set(handles.text20,'Enable','On');
        set(handles.text29,'Enable','On');
        set(handles.edit_pr_3,'Enable','On');
        %enable pattern s4
        set(handles.text_s4,'Enable','On');
        set(handles.checkbox41,'Enable','On');
        set(handles.checkbox42,'Enable','On');
        set(handles.checkbox43,'Enable','On');
        set(handles.text21,'Enable','On');
        set(handles.text22,'Enable','On');
        set(handles.text23,'Enable','On');
        set(handles.text30,'Enable','On');
        set(handles.edit_pr_4,'Enable','On');
        %unable pattern s5
        set(handles.text_s5,'Enable','Off');
        set(handles.checkbox51,'Enable','Off');
        set(handles.checkbox52,'Enable','Off');
        set(handles.checkbox53,'Enable','Off');
        set(handles.text24,'Enable','Off');
        set(handles.text25,'Enable','Off');
        set(handles.text26,'Enable','Off');
        set(handles.text31,'Enable','Off');
        set(handles.edit_pr_5,'Enable','Off');
        
        %clear s1,s2,s3,s4&s5
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.edit_pr_1,'String','');
        set(handles.text16,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.text19,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.text22,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.text25,'String','');
        set(handles.edit_pr_5,'String','');
    case 5
        %enable pattern s1
        set(handles.text_s1,'Enable','On');
        set(handles.checkbox11,'Enable','On');
        set(handles.checkbox12,'Enable','On');
        set(handles.checkbox13,'Enable','On');
        set(handles.text11,'Enable','On');
        set(handles.text12,'Enable','On');
        set(handles.text13,'Enable','On');
        set(handles.text11,'Enable','On');
        set(handles.edit_pr_1,'Enable','On');
        %enable pattern s2
        set(handles.text_s2,'Enable','On');
        set(handles.checkbox21,'Enable','On');
        set(handles.checkbox22,'Enable','On');
        set(handles.checkbox23,'Enable','On');
        set(handles.text15,'Enable','On');
        set(handles.text16,'Enable','On');
        set(handles.text17,'Enable','On');
        set(handles.text28,'Enable','On');
        set(handles.edit_pr_2,'Enable','On');
        %enable pattern s3
        set(handles.text_s3,'Enable','On');
        set(handles.checkbox31,'Enable','On');
        set(handles.checkbox32,'Enable','On');
        set(handles.checkbox33,'Enable','On');
        set(handles.text18,'Enable','On');
        set(handles.text19,'Enable','On');
        set(handles.text20,'Enable','On');
        set(handles.text29,'Enable','On');
        set(handles.edit_pr_3,'Enable','On');
        %enable pattern s4
        set(handles.text_s4,'Enable','On');
        set(handles.checkbox41,'Enable','On');
        set(handles.checkbox42,'Enable','On');
        set(handles.checkbox43,'Enable','On');
        set(handles.text21,'Enable','On');
        set(handles.text22,'Enable','On');
        set(handles.text23,'Enable','On');
        set(handles.text30,'Enable','On');
        set(handles.edit_pr_4,'Enable','On');
        %enable pattern s5
        set(handles.text_s5,'Enable','On');
        set(handles.checkbox51,'Enable','On');
        set(handles.checkbox52,'Enable','On');
        set(handles.checkbox53,'Enable','On');
        set(handles.text24,'Enable','On');
        set(handles.text25,'Enable','On');
        set(handles.text26,'Enable','On');
        set(handles.text31,'Enable','On');
        set(handles.edit_pr_5,'Enable','On');
        
        %clear s1,s2,s3,s4&s5
        set(handles.checkbox11,'Value',0);
        set(handles.checkbox12,'Value',0);
        set(handles.checkbox13,'Value',0);
        
        set(handles.checkbox21,'Value',0);
        set(handles.checkbox22,'Value',0);
        set(handles.checkbox23,'Value',0);
        
        set(handles.checkbox31,'Value',0);
        set(handles.checkbox32,'Value',0);
        set(handles.checkbox33,'Value',0);
        
        set(handles.checkbox41,'Value',0);
        set(handles.checkbox42,'Value',0);
        set(handles.checkbox43,'Value',0);
        
        set(handles.checkbox51,'Value',0);
        set(handles.checkbox52,'Value',0);
        set(handles.checkbox53,'Value',0);
        
        set(handles.text12,'String','');
        set(handles.edit_pr_1,'String','');
        set(handles.text16,'String','');
        set(handles.edit_pr_2,'String','');
        set(handles.text19,'String','');
        set(handles.edit_pr_3,'String','');
        set(handles.text22,'String','');
        set(handles.edit_pr_4,'String','');
        set(handles.text25,'String','');
        set(handles.edit_pr_5,'String','');
end

% --- Executes during object creation, after setting all properties.
function pop_pNr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_pNr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Pattern_Nr
Pattern_Nr = 1;
set(hObject,'Value',1);

% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(1,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(1,2) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(1,2) = 1;
    end
else
    f_parameter.Fault_Pattern(1,2) = 0;
end
set(handles.text12,'String',num2str(f_parameter.Fault_Pattern(1,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(1,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(1,1) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(1,1) = 1;
    end
else
    f_parameter.Fault_Pattern(1,1) = 0;
end
set(handles.text12,'String',num2str(f_parameter.Fault_Pattern(1,:)));
save ('fileData','f_parameter');

% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13
ck = get(hObject,'Value');
load('fileData.mat');
if ck == 1
    if sum(f_parameter.Fault_Pattern(1,:))==2
        set(hObject,'Value',0);
        f_parameter.Fault_Pattern(1,3) = 0;
        errordlg('Maximum only 2 kinds of faults can be chosen .','Error');
    else
    f_parameter.Fault_Pattern(1,3) = 1;
    end
else
    f_parameter.Fault_Pattern(1,3) = 0;
end
set(handles.text12,'String',num2str(f_parameter.Fault_Pattern(1,:)));
save ('fileData','f_parameter');


% --- Executes during object creation, after setting all properties.
function checkbox11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','On');
set(hObject,'Value',1);
load('fileData.mat');
f_parameter.Fault_Pattern = [1 0 0;0 0 0;0 0 0;0 0 0;0 0 0 ];
save ('fileData','f_parameter');

% --- Executes during object creation, after setting all properties.
function text12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','On');
set(hObject,'String','1  0  0');


% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data
if Data==1
close;
Fault_model;
elseif Data==2
    close;
end
    

% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','On');


% --- Executes during object creation, after setting all properties.
function text13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','On');


% --- Executes during object creation, after setting all properties.
function text15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
