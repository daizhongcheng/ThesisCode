function varargout = Threshold_setting(varargin)
% THRESHOLD_SETTING MATLAB code for Threshold_setting.fig
%      THRESHOLD_SETTING, by itself, creates a new THRESHOLD_SETTING or raises the existing
%      singleton*.
%
%      H = THRESHOLD_SETTING returns the handle to a new THRESHOLD_SETTING or the handle to
%      the existing singleton*.
%
%      THRESHOLD_SETTING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THRESHOLD_SETTING.M with the given input arguments.
%
%      THRESHOLD_SETTING('Property','Value',...) creates a new THRESHOLD_SETTING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Threshold_setting_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Threshold_setting_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Threshold_setting

% Last Modified by GUIDE v2.5 28-Feb-2017 04:47:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Threshold_setting_OpeningFcn, ...
                   'gui_OutputFcn',  @Threshold_setting_OutputFcn, ...
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


% --- Executes just before Threshold_setting is made visible.
function Threshold_setting_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Threshold_setting (see VARARGIN)

% Choose default command line output for Threshold_setting
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Threshold_setting wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Threshold_setting_OutputFcn(hObject, eventdata, handles) 
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
close;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Selections;




function edit_far_Callback(hObject, eventdata, handles)
% hObject    handle to edit_far (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_far as text
%        str2double(get(hObject,'String')) returns contents of edit_far as a double


% --- Executes during object creation, after setting all properties.
function edit_far_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_far (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_j0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_j0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_j0 as text
%        str2double(get(hObject,'String')) returns contents of edit_j0 as a double


% --- Executes during object creation, after setting all properties.
function edit_j0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_j0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_iteration_Callback(hObject, eventdata, handles)
% hObject    handle to edit_iteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_iteration as text
%        str2double(get(hObject,'String')) returns contents of edit_iteration as a double


% --- Executes during object creation, after setting all properties.
function edit_iteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_iteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_delta_Callback(hObject, eventdata, handles)
% hObject    handle to edit_delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_delta as text
%        str2double(get(hObject,'String')) returns contents of edit_delta as a double


% --- Executes during object creation, after setting all properties.
function edit_delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_gugu_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gugu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gugu as text
%        str2double(get(hObject,'String')) returns contents of edit_gugu as a double


% --- Executes during object creation, after setting all properties.
function edit_gugu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gugu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

%gugu
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\varepsilon  =$$',...
    'Position',[.355 .78],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$ \varepsilon \in (0,1)$$',...
    'Position',[.775 .782],'FontSize',13,'Fontname','MS Sans Serif')
%delta
text('Interpreter','latex','Units','Normalized','String',... 
    '$$\delta =$$',...
    'Position',[.355 .61],'FontSize',13,'Fontname','MS Sans Serif')
text('Interpreter','latex','Units','Normalized','String',... 
    '$$ \delta \in (0,1)$$',...
    'Position',[.775 .612],'FontSize',13,'Fontname','MS Sans Serif')

%J0
text('Interpreter','latex','Units','Normalized','String',... 
    '$$ J_{0}$$',...
    'Position',[.37 .275],'FontSize',13,'Fontname','MS Sans Serif')

%Delta
text('Interpreter','latex','Units','Normalized','String',... 
    '$$ \Delta $$',...
    'Position',[.375 .111],'FontSize',13,'Fontname','MS Sans Serif')


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (isempty(get(handles.edit_far,'String'))==1)||(isempty(get(handles.edit_gugu,'String'))==1)||(isempty(get(handles.edit_j0,'String'))==1)||(isempty(get(handles.edit_delta,'String'))==1)||(isempty(get(handles.edit_iteration,'String'))==1)
    errordlg('Please give complete information of parameters.','Error');
else
    if (str2double(get(handles.edit_gugu,'String'))>=1)||(str2double(get(handles.edit_gugu,'String'))<=0)
        errordlg('gugu should belong to (0,1).','Error');
    else
        if (str2double(get(handles.edit_delta,'String'))>=1)||(str2double(get(handles.edit_delta,'String'))<=0)
            errordlg('Delta should belong to (0,1).','Error');
        else
            if (str2double(get(handles.edit_far,'String'))>=100)||(str2double(get(handles.edit_far,'String'))<=0)
                errordlg('Acceptable FAR should belong to (0,100).','Error');
            else
                if (str2double(get(handles.edit_j0,'String')))<=0
                    errordlg('Initial threshold should be bigger than 0.','Error');
                else
                    if (str2double(get(handles.edit_iteration,'String')))<=0
                        errordlg('Iteration tolerance should be bigger than 0.','Error');
                    else
                    Thres_set = [str2double(get(handles.edit_gugu,'String')) str2double(get(handles.edit_delta,'String')) str2double(get(handles.edit_far,'String')) str2double(get(handles.edit_j0,'String')) str2double(get(handles.edit_iteration,'String'))];
                    % sample size N calculation
                    Sample_size = log(2/Thres_set(2))*1/(2*Thres_set(1)^2);
                    Sample_size = ceil(Sample_size);
                    % save data to .mat file
%                     load ('fileData.mat');
%                     fault_parameter.Thres_set = Thres_set;
%                     fault_parameter.Sample_size = Sample_size;
%                     save ('fileData.mat','fault_parameter');
                    % Threshold and FAR calculation
                    
                    set(handles.edit_onl_Jth,'Enable','On');
                    set(handles.edit_onl_Jth,'String',num2str(5.97)); 
                    set(handles.edit_onl_far,'Enable','On');
                    set(handles.edit_onl_far,'String',num2str(4.89));
                    end
                end
            end
        end
    end
end


function edit_onl_Jth_Callback(hObject, eventdata, handles)
% hObject    handle to edit_onl_Jth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_onl_Jth as text
%        str2double(get(hObject,'String')) returns contents of edit_onl_Jth as a double


% --- Executes during object creation, after setting all properties.
function edit_onl_Jth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_onl_Jth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_onl_far_Callback(hObject, eventdata, handles)
% hObject    handle to edit_onl_far (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_onl_far as text
%        str2double(get(hObject,'String')) returns contents of edit_onl_far as a double


% --- Executes during object creation, after setting all properties.
function edit_onl_far_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_onl_far (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    global Data
   switch Data
       case 1
           set(hObject,'Visible','On');
       case 2
           set(hObject,'Visible','Off');
   end
