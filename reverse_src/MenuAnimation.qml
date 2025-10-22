/****************************************************************************
**
** This file is part of Glinder adventures
**
** Copyright (c) 2011 Nikolaos Gerontidis.*
** All rights reserved.
** Contact:  Nikolaos Gerontidis (n.gerontidis@idealapps.gr)
**
** You may use this file under the terms of the license as follows:
**
** "Redistribution in source and binary forms, with or without
** modification, are prohibitted without prior written permission by
** Nikolaos Gerontidis.
**
****************************************************************************/

import QtQuick 1.1

SequentialAnimation {
    property Item first
    property Item second

    PropertyAction { target: second; property: "visible"; }
    NumberAnimation { target: first; property: "opacity"; duration: 300; }
    NumberAnimation { target: second; property: "opacity"; duration: 300; }
    PropertyAction { target: first; property: "visible"; }
}
