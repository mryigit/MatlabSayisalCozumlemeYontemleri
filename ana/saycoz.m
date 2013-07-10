function varargout = saycoz(varargin)
% SAYCOZ M-file for saycoz.fig
%      SAYCOZ, by itself, creates a new SAYCOZ or raises the existing
%      singleton*.
%
%      H = SAYCOZ returns the handle to a new SAYCOZ or the handle to
%      the existing singleton*.
%
%      SAYCOZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAYCOZ.M with the given input arguments.
%
%      SAYCOZ('Property','Value',...) creates a new SAYCOZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before saycoz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to saycoz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help saycoz

% Last Modified by GUIDE v2.5 13-Dec-2012 00:52:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @saycoz_OpeningFcn, ...
                   'gui_OutputFcn',  @saycoz_OutputFcn, ...
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


% --- Executes just before saycoz is made visible.
function saycoz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to saycoz (see VARARGIN)

% Choose default command line output for saycoz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes saycoz wait for user response (see UIRESUME)
% uiwait(handles.figure1);

javaFrame = get(hObject,'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('omulogo.jpg'));
% --- Outputs from this function are returned to the command line.
function varargout = saycoz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in spl.
function spl_Callback(hObject, eventdata, handles)
    birderspl();
guidata(hObject, handles);

function gjm_Callback(hObject, eventdata, handles)
    Gaussjor();
guidata(hObject, handles);

function jacob_Callback(hObject, eventdata, handles)
    Jacob();
guidata(hObject, handles);

function koks_Callback(hObject, eventdata, handles)
    kokbul();
guidata(hObject, handles);

function taylor_Callback(hObject, eventdata, handles)
    taylor();
guidata(hObject, handles);

function cikis_Callback(hObject, eventdata, handles)
    exit();
guidata(hObject, handles);


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hakkinda.
function hakkinda_Callback(hObject, eventdata, handles)
    hakkinda();
