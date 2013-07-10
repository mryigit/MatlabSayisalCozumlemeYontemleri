function varargout = birderspl(varargin)
% BIRDERSPL M-file for birderspl.fig
%      BIRDERSPL, by itself, creates a new BIRDERSPL or raises the existing
%      singleton*.
%
%      H = BIRDERSPL returns the handle to a new BIRDERSPL or the handle to
%      the existing singleton*.
%
%      BIRDERSPL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BIRDERSPL.M with the given input arguments.
%
%      BIRDERSPL('Property','Value',...) creates a new BIRDERSPL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before birderspl_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to birderspl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help birderspl

% Last Modified by GUIDE v2.5 08-Dec-2012 22:41:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @birderspl_OpeningFcn, ...
                   'gui_OutputFcn',  @birderspl_OutputFcn, ...
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


% --- Executes just before birderspl is made visible.
function birderspl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to birderspl (see VARARGIN)

% Choose default command line output for birderspl
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes birderspl wait for user response (see UIRESUME)
% uiwait(handles.figure1);

javaFrame = get(hObject,'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('omulogo.jpg'));
% --- Outputs from this function are returned to the command line.
function varargout = birderspl_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function matris_Callback(hObject, eventdata, handles)
    gecici = inline( get(hObject,'String') );
    handles.mt = gecici(1);
guidata(hObject, handles);

function matris_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton1_Callback(hObject, eventdata, handles)
    if handles.derece == 1
        handles.sonuc = birinci_dereceden_spline(handles.mt);
        
    elseif handles.derece == 2
        handles.sonuc = ikinci_dereceden_spline(handles.mt);
    else
        handles.sonuc = 'Seçim yapmadýnýz';
    end
    set(handles.listbox3,'String', char(handles.sonuc));
guidata(hObject, handles);


function popupmenu1_Callback(hObject, eventdata, handles)
    contents = cellstr(get(hObject,'String'));
    switch get(hObject,'Value')
        case 1
            handles.derece = 3;
        case 2
            handles.derece = 1;
        case 3
            handles.derece = 2;
    end
guidata(hObject, handles);

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%cellstr(set(hObject,'String','123123'));
%contents{get(hObject,'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

