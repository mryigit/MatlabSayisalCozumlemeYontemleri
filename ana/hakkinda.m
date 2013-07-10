function varargout = hakkinda(varargin)
% HAKKINDA M-file for hakkinda.fig
%      HAKKINDA, by itself, creates a new HAKKINDA or raises the existing
%      singleton*.
%
%      H = HAKKINDA returns the handle to a new HAKKINDA or the handle to
%      the existing singleton*.
%
%      HAKKINDA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HAKKINDA.M with the given input arguments.
%
%      HAKKINDA('Property','Value',...) creates a new HAKKINDA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hakkinda_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hakkinda_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hakkinda

% Last Modified by GUIDE v2.5 13-Dec-2012 01:29:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hakkinda_OpeningFcn, ...
                   'gui_OutputFcn',  @hakkinda_OutputFcn, ...
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


% --- Executes just before hakkinda is made visible.
function hakkinda_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hakkinda (see VARARGIN)

% Choose default command line output for hakkinda
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hakkinda wait for user response (see UIRESUME)
% uiwait(handles.figure1);

javaFrame = get(hObject,'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('omulogo.jpg'));
% --- Outputs from this function are returned to the command line.
function varargout = hakkinda_OutputFcn(hObject, eventdata, handles) 
    
varargout{1} = handles.output;
yaz{1} = 'Bu program sayýsal çözümleme dersi için';
yaz{2} = 'Murat YÝÐÝT tarafýndan kodlanmýþtýr';
yaz{3} = 'iletiþim : mr.yigit@bil.omu.edu.tr';
yaz{4} = 'kaynak kodlar için : https://github.com/mryigit';
yaz{5} = 'adresini ziyaret ediniz.'
set(handles.hakkindagos,'String', yaz);
% --- Executes during object creation, after setting all properties.
function hakkindagos_CreateFcn(hObject, eventdata, handles)
    
