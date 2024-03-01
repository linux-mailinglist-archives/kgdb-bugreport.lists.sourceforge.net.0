Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6545686DA0C
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  1 Mar 2024 04:31:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rftcl-0003Fa-V1
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 01 Mar 2024 03:31:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rftck-0003FR-8A
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 01 Mar 2024 03:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jqABAPinIeSW8r47TeU7SpC3jbn5amSg5vy82qMBGxc=; b=I5JcST0ldlpHSA4cMRjPly8bf+
 p4TDibpTI6DfZn1GpE9655x7HK3IIoREufPcEGFkpGGueNCqcKBCpghy8zvite1LB+Dyg5eeIyTQz
 XpoAbCYlD4Pohcj5SzLDtO4wO8PiKD3PK7uUkA7q7Xc8pT6GBilRiM3BCwd9QxAdMM4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jqABAPinIeSW8r47TeU7SpC3jbn5amSg5vy82qMBGxc=; b=fogI0QFweNfeGt0MRtZXJJrP1e
 QAnwJ21olXKJMgUsG86gJug6IjX0IJyLritCa1WSViSe7oYn0ZtB4EwbxIJBRs4s94nlmTXWD6jLg
 uP2tqR1rg6gOIM/wj4s95tIX0xAYZWLMlbB5DfxZG2WiGtQHS5Ax6mh4hLu5ztgvoQyk=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rftch-0000Fo-IJ for kgdb-bugreport@lists.sourceforge.net;
 Fri, 01 Mar 2024 03:31:50 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 4213UQ8F071199;
 Fri, 1 Mar 2024 11:30:26 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX01-IMDC.srv.huawei-3com.com (unknown [10.62.14.10])
 by mail.maildlp.com (Postfix) with ESMTP id 538602004BBA;
 Fri,  1 Mar 2024 11:31:37 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX01-IMDC.srv.huawei-3com.com (10.62.14.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Fri, 1 Mar 2024 11:30:26 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Fri, 1 Mar 2024 11:30:26 +0800
From: Liuye <liu.yeC@h3c.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Thread-Topic: [PATCH] kdb: Fix the deadlock issue in KDB debugging.
Thread-Index: AQHaafG3YC/Li+j42kau1FDQhHr2m7EfIsgAgAMadaA=
Date: Fri, 1 Mar 2024 03:30:25 +0000
Message-ID: <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
 <20240228120516.GA22898@aspen.lan>
In-Reply-To: <20240228120516.GA22898@aspen.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 4213UQ8F071199
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On Wed, Feb 28, 2024 at 10:56:02AM +0800, LiuYe wrote: >>
 master cpu : After executing the go command, a deadlock occurs. >> slave
 cpu: may be performing thread migration, >> acquiring the running qu [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rftch-0000Fo-IJ
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogW1BBVENIXSBrZGI6IEZpeCB0aGUg?=
 =?gb2312?b?ZGVhZGxvY2sgaXNzdWUgaW4gS0RCIGRlYnVnZ2luZy4=?=
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liuye <liu.yeC@h3c.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Pk9uIFdlZCwgRmViIDI4LCAyMDI0IGF0IDEwOjU2OjAyQU0gKzA4MDAsIExpdVllIHdyb3RlOg0K
Pj4gbWFzdGVyIGNwdSA6IEFmdGVyIGV4ZWN1dGluZyB0aGUgZ28gY29tbWFuZCwgYSBkZWFkbG9j
ayBvY2N1cnMuDQo+PiBzbGF2ZSBjcHU6IG1heSBiZSBwZXJmb3JtaW5nIHRocmVhZCBtaWdyYXRp
b24sDQo+PiAgICAgICAgIGFjcXVpcmluZyB0aGUgcnVubmluZyBxdWV1ZSBsb2NrIG9mIG1hc3Rl
ciBDUFUuDQo+PiAgICAgICAgIFRoZW4gaXQgd2FzIGludGVycnVwdGVkIGJ5IGtkYiBOTUkgYW5k
IGVudGVyZWQgdGhlIG5taV9oYW5kbGVyIHByb2Nlc3MuDQo+PiAgICAgICAgIChubWlfaGFuZGxl
LT4ga2dkYl9ubWljYWxsYmFjay0+IGtnZGJfY3B1X2VudGVyDQo+PiAgICAgICAgIHdoaWxlKDEp
eyB0b3VjaCB3YXRoY2RvZ30uKQ0KPg0KPkkgdGhpbmsgdGhpcyBkZXNjcmlwdGlvbiBpcyBhIGxp
dHRsZSBzaG9ydCBhbmQgZG9lc24ndCBjbGVhcmx5IGV4cGxhaW4gdGhlIGNhdXNlLiBIb3cgYWJv
dXQ6DQo+DQo+Q3VycmVudGx5LCBpZiBrZ2Rib2MgaW5jbHVkZXMgJ2tkYicsIHRoZW4ga2dkYm9j
IHdpbGwgYXR0ZW1wdCB0byB1c2Ugc2NoZWR1bGVfd29yaygpIHRvIHByb3Zva2UgYSBrZXlib2Fy
ZCByZXNldCB3aGVuIHRyYW5zaXRpb25pbmcgb3V0IG9mIHRoZSBkZWJ1Z2dlciBhbmQgYmFjayB0
byBub3JtYWwgb3BlcmF0aW9uLiBUaGlzIGNhbiBjYXVzZSBkZWFkbG9jayBiZWNhdXNlIHNjaGVk
dWxlX3dvcmsoKSBpcyBub3QgTk1JLXNhZmUuDQo+DQo+VGhlIHN0YWNrIHRyYWNlIGJlbG93IHNo
b3dzIGFuIGV4YW1wbGUgb2YgdGhlIHByb2JsZW0uIEluIHRoaXMgY2FzZSB0aGUgbWFzdGVyIGNw
dSBpcyBub3QgcnVubmluZyBmcm9tIE5NSSBidXQgaXQgaGFzIHBhcmtlZCB0aGUgc2xhY2UgQ1BV
cyB1c2luZyBhbiBOTUkgYW5kIHRoZSBwYXJrZWQgQ1BVcyBpcyBob2xkaW5nIHNwaW5sb2NrcyBu
ZWVkZWQgYnkgc2NoZWR1bGVfd29yaygpLg0KPg0KPg0KDQpEdWUgdG8gdGhlIGJyZXZpdHkgb2Yg
dGhlIGRlc2NyaXB0aW9uLCB0aGVyZSBtYXkgYmUgc29tZSBtaXN1bmRlcnN0YW5kaW5nLCBzbyBh
IGRldGFpbGVkIGRlc2NyaXB0aW9uIGlzIHByb3ZpZGVkIGFzIGZvbGxvd3M6DQoNCmJlZm9yZSBL
REIgY29tbWFuZCChsGdvobGjug0KDQpXaGVuIGEgc3BlY2lmaWMga2V5IGlzIGRldGVjdGVkIGJ5
IHRoZSBzZXJpYWwgcG9ydCwgaXQgd2lsbCB0cmlnZ2VyIGtnZGJfYnJlYWtwb2ludCwgYW5kIHRo
ZSBtYXN0ZXIgQ1BVMCB3aWxsIGVudGVyIHRoZSBrZGJfbWFpbl9sb29wIHRvIHByb2Nlc3MgdXNl
ciBjb21tYW5kcyBpbiBhIGxvb3AuDQoNCmtnZGJfYnJlYWtwb2ludA0KaW50Mw0KZG9faW50Mw0K
bm90aWZ5X2RpZQ0KYXRvbWljX25vdGlmaWVyX2NhbGxfY2hhaW4NCl9fYXRvbWljX25vdGlmaWVy
X2NhbGxfY2hhaW4NCm5vdGlmaWVyX2NhbGxfY2hhaW4NCmtnZGJfbm90aWZ5DQpfX2tnZGJfbm90
aWZ5DQprZ2RiX2hhbmRsZV9leGNlcHRpb24NCmtnZGJfY3B1X2VudGVyIChrZ2RiX3JvdW5kdXBf
Y3B1cyBzZW5kIElQSSB0byBvdGhlciBzbGF2ZSBDUFUpDQprZGJfc3R1Yg0Ka2RiX21haW5fbG9v
cA0KDQpzbGF2ZSBDUFUxLCBDUFUyLCBDUFUzIC4uLiBhbmQgb3RoZXIgQ1BVczoNClVzaW5nIENQ
VTEgYXMgYW4gZXhhbXBsZToNCkN1cnJlbnRseSBob2xkaW5nIHRoZSBydW5uaW5nIHF1ZXVlIGxv
Y2sgb2YgdGhlIG1hc3RlciBDUFUwIGR1ZSB0byBsb2FkX2JhbGFuY2Ugb3Igb3RoZXIgcmVhc29u
cywgcmVzcG9uZGluZyB0byB0aGUgTk1JIHNlbnQgYnkgbWFzdGVyIENQVTAgdGhyb3VnaCBrZ2Ri
X3JvdW5kdXBfY3B1cy4gRW50ZXIgdGhlIGZvbGxvd2luZyBzdGFjazoNCm5taV9oYW5kbGUNCmtn
ZGJfbm1pY2FsbGJhY2sNCmtnZGJfY3B1X2VudGVyIChUaGUgc2xhdmUgQ1BVMSB3aWxsIGxvb3Ag
dG91Y2ggd2F0Y2hkb2cgYW5kIHdhaXQgZm9yIHRoZSBtYXN0ZXIgQ1BVMCB0byBleGl0LikNCg0K
VGhlIGFib3ZlIGlzIHRoZSBzdGF0ZSBiZWZvcmUgZXhlY3V0aW5nIHRoZSBLREIgY29tbWFuZCAi
Z28iLg0KDQpXaGVuIHRoZSB1c2VyIGV4ZWN1dGVzIHRoZSBLREIgY29tbWFuZCAiZ28iLCBpdCB3
aWxsIHRyaWdnZXIgYSBkZWFkbG9jay4NCm1hc3RlciBDUFUwIDoNCmtkYl9tYWluX2xvb3AgcmV0
dXJuDQprZGJfc3R1YiByZXR1cm4NCmtnZGJfY3B1X2VudGVyDQprZ2Rib2NfcG9zdF9leHBfaGFu
ZGxlcg0KcXVldWVfd29ya19vbg0KX19xdWV1ZV93b3JrDQppbnNlcnRfd29yaw0Kd2FrZV91cF9w
cm9jZXNzDQp0cnlfdG9fd2FrZV91cA0KX3Jhd19zcGluX2xvY2sgo6hBY3F1aXJlIHRoZSBzcGlu
IGxvY2sgb2YgbWFzdGVyIENQVTAgcnEtPmxvY2ssIGJ1dCBhdCB0aGlzIHRpbWUgdGhlIHNwaW4g
bG9jayBvZiBtYXN0ZXIgQ1BVMCBpcyBoZWxkIGJ5IENQVTGjqQ0KDQpBcyBhIHJlc3VsdCwgYSBk
ZWFkbG9jayBoYXMgb2NjdXJyZWQuDQoNClRoZXJlZm9yZSwgd2hlbiB0aGUgbWFzdGVyIENQVTAg
ZXhpdHMsIGlmIHRoZSBycS0+bG9jayBvZiBDUFUwIGlzIGxvY2tlZCwgaXQgc2hvdWxkIG5vdCB3
YWtlIHVwIHRoZSB3b3JrZXIgb24gdGhlIHN5c3RlbV93cS4NCg0KPj4gZXhhbXBsZToNCj4+ICBC
VUc6IHNwaW5sb2NrIGxvY2t1cCBzdXNwZWN0ZWQgb24gQ1BVIzAsIG5hbWV4LzEwNDUwDQo+PiAg
bG9jazogMHhmZmZmODgxZmZlODIzOTgwLCAubWFnaWM6IGRlYWQ0ZWFkLCAub3duZXI6IG5hbWV4
eC8yMTg4OCwNCj4+IC5vd25lcl9jcHU6IDENCj4+ICBmZmZmODgxNzQxZDAwMDAwIGZmZmY4ODE3
NDFjMDEwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+PiAgZmZmZjg4MTc0
MGY1OGU3OCBmZmZmODgxNzQxY2ZmZGQwIGZmZmZmZmZmODE0N2E3ZmMgZmZmZjg4MTc0MGY1OGYy
MA0KPj4gQ2FsbCBUcmFjZToNCj4+ICBbPGZmZmZmZmZmODE0NzllNmQ+XSA/IF9fc2NoZWR1bGUr
MHgxNmQvMHhhYzAgIFs8ZmZmZmZmZmY4MTQ3YTdmYz5dID8NCj4+IHNjaGVkdWxlKzB4M2MvMHg5
MCAgWzxmZmZmZmZmZjgxNDdlNzFhPl0gPw0KPj4gc2NoZWR1bGVfaHJ0aW1lb3V0X3JhbmdlX2Ns
b2NrKzB4MTBhLzB4MTIwDQo+PiAgWzxmZmZmZmZmZjgxNDdkMjJlPl0gPyBtdXRleF91bmxvY2sr
MHhlLzB4MTAgIFs8ZmZmZmZmZmY4MTFjODM5Yj5dID8NCj4+IGVwX3NjYW5fcmVhZHlfbGlzdCsw
eDFkYi8weDFlMCAgWzxmZmZmZmZmZjgxNDdlNzQzPl0gPw0KPj4gc2NoZWR1bGVfaHJ0aW1lb3V0
X3JhbmdlKzB4MTMvMHgyMA0KPj4gIFs8ZmZmZmZmZmY4MTFjODY0YT5dID8gZXBfcG9sbCsweDI3
YS8weDNiMCAgWzxmZmZmZmZmZjgxMDhjNTQwPl0gPw0KPj4gd2FrZV91cF9xKzB4NzAvMHg3MCAg
WzxmZmZmZmZmZjgxMWM5OWE4Pl0gPyBTeVNfZXBvbGxfd2FpdCsweGI4LzB4ZDANCj4+IFs8ZmZm
ZmZmZmY4MTQ3ZjI5Nj5dID8gZW50cnlfU1lTQ0FMTF82NF9mYXN0cGF0aCsweDEyLzB4NzUNCj4+
ICBDUFU6IDAgUElEOiAxMDQ1MCBDb21tOiBuYW1leCBUYWludGVkOiBHICAgICAgICAgICBPICAg
IDQuNC42NSAjMQ0KPj4gIEhhcmR3YXJlIG5hbWU6IEluc3lkZSBQdXJsZXkvVHlwZTIgLSBCb2Fy
ZCBQcm9kdWN0IE5hbWUxLCBCSU9TIDA1LjIxLjUxLjAwMzYgMDcvMTkvMjAxOQ0KPj4gICAwMDAw
MDAwMDAwMDAwMDAwIGZmZmY4ODFmZmU4MTNjMTAgZmZmZmZmZmY4MTI0ZTg4MyBmZmZmODgxNzQx
YzAxMDAwDQo+PiAgIGZmZmY4ODFmZmU4MjM5ODAgZmZmZjg4MWZmZTgxM2MzOCBmZmZmZmZmZjgx
MGE3ZjdmIGZmZmY4ODFmZmU4MjM5ODANCj4+ICAgMDAwMDAwMDA3ZDJiN2NkMCAwMDAwMDAwMDAw
MDAwMDAxIGZmZmY4ODFmZmU4MTNjNjggZmZmZmZmZmY4MTBhODBlMA0KPj4gICBDYWxsIFRyYWNl
Og0KPj4gICA8I0RCPiAgWzxmZmZmZmZmZjgxMjRlODgzPl0gZHVtcF9zdGFjaysweDg1LzB4YzIN
Cj4+ICAgWzxmZmZmZmZmZjgxMGE3ZjdmPl0gc3Bpbl9kdW1wKzB4N2YvMHgxMDANCj4+ICAgWzxm
ZmZmZmZmZjgxMGE4MGUwPl0gZG9fcmF3X3NwaW5fbG9jaysweGEwLzB4MTUwDQo+PiAgIFs8ZmZm
ZmZmZmY4MTQ3ZWI1NT5dIF9yYXdfc3Bpbl9sb2NrKzB4MTUvMHgyMA0KPj4gICBbPGZmZmZmZmZm
ODEwOGMyNTY+XSB0cnlfdG9fd2FrZV91cCsweDE3Ni8weDNkMA0KPj4gICBbPGZmZmZmZmZmODEw
OGM0YzU+XSB3YWtlX3VwX3Byb2Nlc3MrMHgxNS8weDIwDQo+PiAgIFs8ZmZmZmZmZmY4MTA3YjM3
MT5dIGluc2VydF93b3JrKzB4ODEvMHhjMA0KPj4gICBbPGZmZmZmZmZmODEwN2I0ZTU+XSBfX3F1
ZXVlX3dvcmsrMHgxMzUvMHgzOTANCj4+ICAgWzxmZmZmZmZmZjgxMDdiNzg2Pl0gcXVldWVfd29y
a19vbisweDQ2LzB4OTANCj4+ICAgWzxmZmZmZmZmZjgxMzEzZDI4Pl0ga2dkYm9jX3Bvc3RfZXhw
X2hhbmRsZXIrMHg0OC8weDcwDQo+PiAgIFs8ZmZmZmZmZmY4MTBlZDQ4OD5dIGtnZGJfY3B1X2Vu
dGVyKzB4NTk4LzB4NjEwDQo+PiAgIFs8ZmZmZmZmZmY4MTBlZDZlMj5dIGtnZGJfaGFuZGxlX2V4
Y2VwdGlvbisweGYyLzB4MWYwDQo+PiAgIFs8ZmZmZmZmZmY4MTA1NGUyMT5dIF9fa2dkYl9ub3Rp
ZnkrMHg3MS8weGQwDQo+PiAgIFs8ZmZmZmZmZmY4MTA1NGViNT5dIGtnZGJfbm90aWZ5KzB4MzUv
MHg3MA0KPj4gICBbPGZmZmZmZmZmODEwODJlNmE+XSBub3RpZmllcl9jYWxsX2NoYWluKzB4NGEv
MHg3MA0KPj4gICBbPGZmZmZmZmZmODEwODMwNGQ+XSBub3RpZnlfZGllKzB4M2QvMHg1MA0KPj4g
ICBbPGZmZmZmZmZmODEwMTcyMTk+XSBkb19pbnQzKzB4ODkvMHgxMjANCj4+ICAgWzxmZmZmZmZm
ZjgxNDgwZmI0Pl0gaW50MysweDQ0LzB4ODANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMaXVZZSA8
bGl1LnllQ0BoM2MuY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5j
IHwgNiArKysrKy0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2MuYyBi
L2RyaXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2MuYw0KPj4gaW5kZXggN2NlN2JiMTY0Li45NDUzMThl
ZjEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMNCj4+ICsrKyBi
L2RyaXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2MuYw0KPj4gQEAgLTIyLDYgKzIyLDkgQEANCj4+ICAj
aW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9zZXJpYWxfY29yZS5oPg0KPj4gKyNpbmNsdWRl
IDxsaW51eC9zbXAuaD4NCj4+ICsNCj4+ICsjaW5jbHVkZSAiLi4va2VybmVsL3NjaGVkL3NjaGVk
LmgiDQo+Pg0KPj4gICNkZWZpbmUgTUFYX0NPTkZJR19MRU4gICAgICAgICA0MA0KPj4NCj4+IEBA
IC0zOTksNyArNDAyLDggQEAgc3RhdGljIHZvaWQga2dkYm9jX3Bvc3RfZXhwX2hhbmRsZXIodm9p
ZCkNCj4+ICAgICAgICAgICAgICAgICBkYmdfcmVzdG9yZV9ncmFwaGljcyA9IDA7DQo+PiAgICAg
ICAgICAgICAgICAgY29uX2RlYnVnX2xlYXZlKCk7DQo+PiAgICAgICAgIH0NCj4+IC0gICAgICAg
a2dkYm9jX3Jlc3RvcmVfaW5wdXQoKTsNCj4+ICsgICAgICAgaWYgKCFyYXdfc3Bpbl9pc19sb2Nr
ZWQoJihjcHVfcnEoc21wX3Byb2Nlc3Nvcl9pZCgpKS0+bG9jaykpKQ0KPj4gKyAgICAgICAgICAg
ICAgIGtnZGJvY19yZXN0b3JlX2lucHV0KCk7DQo+DQo+SSBkb24ndCB0aGluayBzb2x2aW5nIHRo
aXMgYnkgYWNjZXNzIGludGVybmFsIHNjaGVkdWxlciBzdGF0ZSBpcyB0aGUgcmlnaHQgYXBwcm9h
Y2ggLg0KPg0KPlRoZSBkZXNjcmlwdGlvbiBJIHdyb3RlIGFib3ZlIHBlcmhhcHMgYWxyZWFkeSBz
dWdnZXN0cyB3aHkuIFRoZSBkZWFkbG9jayBvY2N1cnMgYmVjYXVzZSBpdCBpcyB1bnNhZmUgdG8g
Y2FsbCBzY2hlZHVsZV93b3JrKCkgZnJvbSB0aGUgZGVidWcgdHJhcCBoYW5kbGVyLiBUaGUgZGVi
dWcgdHJhcCBoYW5kbGVyIGluIHlvdXIgc3RhY2sgdHJhY2UgaXMgbm90IHJ1bm5pbmcgZnJvbSBh
biBOTUkgYnV0IGl0IGNlcnRhaW5seSBoYXMgTk1JLWxpa2UgcHJvcGVydGllcy4gVGhlcmVmb3Jl
IGEgYmV0dGVyIGZpeCBpcyBub3QgdG8gY2FsbCBzY2hlZHVsZV93b3JrKCkgYXQgYWxsIGZyb20g
dGhlIGRlYnVnIHRyYXAgaGFuZGxlci4NCj4NCj5JbnN0ZWFkIHdlIG5lZWQgdG8gdXNlIGFuIE5N
SS1zYWZlIEFQSSBzdWNoIGFzIGlycV93b3JrX3F1ZXVlKCkgYW5kIHRoYXQgaXJxX3dvcmsgY2Fu
IGNhbGwgc2NoZWR1bGVfd29yaygpIGFuZCB0cmlnZ2VyIHRoZSBrZXlib2FyZCByZXNldC4NCj4N
Cj4NCj5EYW5pZWwuDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Ksb7Tyrz+vLDG5Li9vP66rNPQ
0MK7qsj9vK/NxbXEsaPD3NDFz6KjrL32z97T2reiy824+MnPw+a12Na31tDB0LP2DQq1xLj2yMu7
8si61+mho7371rnIzrrOxuTL+8jL0tTIzrrO0M7Kvcq508OjqLD8wKi1q7K7z97T2sirsr+78rK/
t9a12NC5wrahori01sahog0Ku/LJoreio6mxvtPKvP7W0LXE0MXPoqGjyOe5+8T6tO3K1cHLsb7T
yrz+o6zH68T6waK8tLXnu7C78tPKvP7NqNaqt6K8/sjLsqLJvrP9sb4NCtPKvP6joQ0KVGhpcyBl
LW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlv
biBmcm9tIE5ldyBIM0MsIHdoaWNoIGlzDQppbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29uIG9y
IGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92ZS4gQW55IHVzZSBvZiB0aGUNCmlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90
IGxpbWl0ZWQgdG8sIHRvdGFsIG9yIHBhcnRpYWwNCmRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwg
b3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZA0KcmVj
aXBpZW50KHMpIGlzIHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZlIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXINCmJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0
ZWx5IGFuZCBkZWxldGUgaXQhDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
