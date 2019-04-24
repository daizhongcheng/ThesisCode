function varargout = Sample(varargin)
% SAMPLE MATLAB code for Sample.fig
%      SAMPLE, by itself, creates a new SAMPLE or raises the existing
%      singleton*.
%
%      H = SAMPLE returns the handle to a new SAMPLE or the handle to
%      the existing singleton*.
%
%      SAMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAMPLE.M with the given input arguments.
%
%      SAMPLE('Property','Value',...) creates a new SAMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sample_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sample_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sample

% Last Modified by GUIDE v2.5 04-May-2017 13:52:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sample_OpeningFcn, ...
                   'gui_OutputFcn',  @Sample_OutputFcn, ...
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


% --- Executes just before Sample is made visible.
function Sample_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sample (see VARARGIN)

% Choose default command line output for Sample
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sample wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sample_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.edit_samplesize,'String'))
    errordlg('Please set sample size.','Error');
else
    Significancelvl = str2double(get(handles.popup_siglvl,'String'));
    Accuracy = str2double(get(handles.popup_accuracy,'String'));
    load('fileData.mat');
    f_parameter.samples_para = {Significancelvl, Accuracy };
    f_parameter.Sample_Size = str2double(get(handles.edit_samplesize,'String'));
    save ('fileData','f_parameter');
    close(gcf);
    handles=guihandles;
    set(handles.pushbutton_far,'Enable','On');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
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
