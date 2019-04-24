 %% start the toolbox
clc;clear;close;
% NOTE! change the path
s = pwd;
addpath ([s, '\online detection FDR']);
addpath ([s, '\random model']);
addpath ([s, '\statistic functions']);
addpath ([s, '\GUI']);
addpath ([s, '\offline training']);
addpath ([s, '\offline FAR']);
addpath ([s, '\toolbox function']);
addpath ([s, '\model driven']);


run GUI\Data_type.m
