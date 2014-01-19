%define name php-install
%define version 0.0.2
%define release 1

%define buildroot %{_topdir}/BUILDROOT

BuildRoot: %{buildroot}
Source0: https://github.com/marcosdsanchez/%{name}/archive/v%{version}.tar.gz
Summary: Installs different versions of php
Name: %{name}
Version: %{version}
Release: %{release}
License: MIT
URL: https://github.com/marcosdsanchez/php-install#readme
AutoReqProv: no
BuildArch: noarch
Requires: wget, bash

%description
Installs different versions of php

%prep
%setup -q

%build

%install
make install PREFIX=%{buildroot}/usr

%files
%defattr(-,root,root)
%{_bindir}/php-install
%{_datadir}/%{name}/*
%{_mandir}/man1/*
%doc
%{_defaultdocdir}/%{name}-%{version}/*

%changelog
* Tue Oct 29 2013 marcosdsanchez <marcosdsanchez@gmail.com> - 0.0.1
- Initial release
