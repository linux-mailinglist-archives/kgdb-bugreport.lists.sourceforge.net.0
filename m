Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B5E89EDC6
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 10:39:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruTUJ-00032X-Kn
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 08:39:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1ruTUG-00031Y-FP
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 08:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZO2PG/fMQB+8VlbmBQVf9zcfZmh9qOkdCf4vHQD3Px4=; b=PjX6vINIxh+G6sns+jgDnAdK05
 Ku564vqGCtu3C+0MfGb4AuXejewzIVvYK5pNNLGj9H0H4i5TEYpqLwZ89qzgGMWJvA5U+YxwGfrH7
 3laiO7ekpt4/x6vzVTduGIRZnJwt8xqp197iEHjJNbl8ZzxuXVA4GdzrH3HLoCv2eumY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZO2PG/fMQB+8VlbmBQVf9zcfZmh9qOkdCf4vHQD3Px4=; b=OOZLt7q4J3yGWSbalfaLxL4+yl
 r5P6xzdL+64xvJA7Pq9x3WIYDNwjvuMYpxQpxfK3hncXwQ4IXP0tghtgUFJZfFQVFt8PzKTgBhTs5
 uUyT6nxHTWMP7fszZ7LGLJqCDZJf+Ky/eO/n6kTMJwd1lUZ5xt7GnJm6j4k+lvsx79kM=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruTUE-0004Jw-O3 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 08:39:20 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 43A8c4T8014703;
 Wed, 10 Apr 2024 16:38:04 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX11-BJD.srv.huawei-3com.com (unknown [10.153.34.13])
 by mail.maildlp.com (Postfix) with ESMTP id CB763235AF7B;
 Wed, 10 Apr 2024 16:40:14 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX11-BJD.srv.huawei-3com.com (10.153.34.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Wed, 10 Apr 2024 16:38:06 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Wed, 10 Apr 2024 16:38:06 +0800
From: Liuye <liu.yeC@h3c.com>
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENIIFYxMF0ga2RiOiBGaXgg?=
 =?utf-8?Q?the_deadlock_issue_in_KDB_debugging.?=
Thread-Index: AQHaiuuw81gSSyk26Eq+v/7KfdTz2LFgdGkAgACJimD//36cAIAAh7Hw//98qQCAAIohAP//mg0AABEeCaA=
Date: Wed, 10 Apr 2024 08:38:06 +0000
Message-ID: <8f0487eaf15442f5b0bf7a6cafa5b973@h3c.com>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
 <2024041014-padlock-aggregate-4705@gregkh>
 <0c004dd44ad5478eba9451186f4ec962@h3c.com>
 <2024041001-retaliate-cork-1fe5@gregkh>
 <5c659d5f41ff4cf69ea9467b62d74e9b@h3c.com>
 <2024041022-electable-unblock-5077@gregkh>
 <567857bab013409ca53fa7c36292f4b0@h3c.com>
 <2024041007-busload-equipment-b673@gregkh>
In-Reply-To: <2024041007-busload-equipment-b673@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 43A8c4T8014703
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On Wed, Apr 10, 2024 at 06:30:59AM +0000, Liuye wrote: >>
 >On Wed, Apr 10, 2024 at 06:10:10AM +0000, Liuye wrote: >> >> >On Wed, Apr
 10, 2024 at 05:54:08AM +0000, Liuye wrote: >> >> >> >> Signed-off- [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [60.191.123.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ruTUE-0004Jw-O3
Subject: [Kgdb-bugreport] =?utf-8?b?562U5aSNOiDnrZTlpI06IOetlOWkjTog562U?=
 =?utf-8?q?=E5=A4=8D=3A_=5BPATCH_V10=5D_kdb=3A_Fix_the_deadlock_issue_in_K?=
 =?utf-8?q?DB_debugging=2E?=
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Pk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA2OjMwOjU5QU0gKzAwMDAsIExpdXllIHdyb3RlOg0K
Pj4gPk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA2OjEwOjEwQU0gKzAwMDAsIExpdXllIHdyb3Rl
Og0KPj4gPj4gPk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA1OjU0OjA4QU0gKzAwMDAsIExpdXll
IHdyb3RlOg0KPj4gPj4gPj4gPj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQo+PiA+PiA+PiA+DQo+PiA+PiA+PiA+SSBoYXZlIE5PVCBzaWduZWQg
b2ZmIG9uIHRoaXMgY29tbWl0LiAgWW91IGp1c3Qgc2FpZCB0aGF0IEkgbWFkZSBhIGxlZ2FsIHN0
YXRlbWVudCBhYm91dCB0aGlzIGNvbW1pdCB3aXRob3V0IHRoYXQgYWN0dWFsbHkgYmVpbmcgdHJ1
ZT8/Pw0KPj4gPj4gPj4gPg0KPj4gPj4gPj4gPlNvcnJ5LCBidXQgdGhhdCBpcyBmbGF0IG91dCBu
b3QgYWNjZXB0YWJsZSBhdCBhbGwuICBQbGVhc2UgZ28gd29yayB3aXRoIHlvdXIgY29tcGFueSBs
YXd5ZXJzIHRvIGZpZ3VyZSBvdXQgd2hhdCB5b3UgZGlkIGFuZCBjb21lIGJhY2sgd2l0aCBhbiBl
eHBsYWluYXRpb24gb2YgZXhhY3RseSB3aGF0IHRoaXMgaXMgYW5kIGhvdyBpdCB3aWxsIG5vdCBo
YXBwZW4gYWdhaW4uDQo+PiA+PiA+PiA+DQo+PiA+PiA+PiANCj4+ID4+ID4+ID4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4+ID4+
ID4+ID4NCj4+ID4+ID4+ID4+IFY5IC0+IFYxMCA6IEFkZCBTaWduZWQtb2ZmLWJ5IG9mIEdyZWcg
S0ggYW5kIEFuZHkgU2hldmNoZW5rbywgDQo+PiA+PiA+PiA+PiBBY2tlZC1ieSBvZiBEYW5pZWwg
VGhvbXBzb24NCj4+ID4+ID4+ID4NCj4+ID4+ID4+ID5IdWg/IQ0KPj4gPj4gPj4gDQo+PiA+PiA+
PiBAZ3JlZyBrLWgg77yaDQo+PiA+PiA+PiBAQW5keSBTaGV2Y2hlbmtvIO+8mg0KPj4gPj4gPj4g
DQo+PiA+PiA+PiBTb3JyeSwgaXQgd2FzIG15IG1pc3Rha2UuIEkgbWlzdW5kZXJzdG9vZCB0aGUg
bWVhbmluZyBvZiAic2lnbmVkLW9mZi1ieSIsIHdoaWNoIGxlZCB0byB1c2FnZSBpc3N1ZXMuDQo+
PiA+PiA+PiANCj4+ID4+ID4+IEkgd2FudCB0byBleHByZXNzIG15IGdyYXRpdHVkZSBmb3IgdGhl
IHN1Z2dlc3Rpb25zIG9uIHRoZSBwYXRjaCBmcm9tIHRoZSB0d28gb2YgeW91LiANCj4+ID4+ID4+
IA0KPj4gPj4gPj4gV2hhdCBkbyBJIG5lZWQgdG8gZG8gbm93PyBSZWxlYXNlIFBBVENIIFYxMSBh
bmQgZGVsZXRlIHRoZXNlIHR3byBzaWduYXR1cmVzIGluIGl0ID8NCj4+ID4+ID4NCj4+ID4+ID5B
cyBJIHNhaWQsIGdvIHdvcmsgd2l0aCB5b3VyIGNvcnBvcmF0ZSBsYXd5ZXJzIG9uIHRoaXMgdG8g
dW5kZXJzdGFuZCB3aGF0IGp1c3QgaGFwcGVuZWQgYW5kIGhhdmUgdGhlbSBsZXQgdXMga25vdyBo
b3cgaXQgd2lsbCBub3QgaGFwcGVuIGFnYWluLg0KPj4gPj4gDQo+PiA+PiBJJ20gdmVyeSBzb3Jy
eSwgdGhpcyBpcyBteSBmaXJzdCB0aW1lIHN1Ym1pdHRpbmcgYSBwYXRjaCBhbmQgSSBtYWRlIGEg
c2lnbmlmaWNhbnQgbWlzdGFrZSBpbiB1c2luZyAiU2lnbmVkLW9mZi1ieSIuIEkgbm93IHVuZGVy
c3RhbmQgdGhlIG1lYW5pbmcgb2YgdGhpcyBmaWVsZCBhbmQgd2lsbCBub3QgbWFrZSB0aGUgc2Ft
ZSBtaXN0YWtlIGFnYWluIGluIHRoZSBmdXR1cmUuDQo+PiA+DQo+PiA+VW5kZXJzdG9vZCwgYnV0
IHlvdSBzdGlsbCBuZWVkIHRvIGdvIHdvcmsgd2l0aCB5b3VyIGNvcnBvcmF0ZSBsZWdhbCBncm91
cCBzbyB0aGF0IHlvdSBhbGwgZW5zdXJlIHRoaXMgZG9lcyBub3QgaGFwcGVuIGFnYWluIGZvciBh
bnkgb3RoZXIgZGV2ZWxvcGVyIGluIHlvdXIgY29tcGFueSwgYXMgSSBhbSBzdXJlIHRoZXkgd2ls
bCB3YW50IHRvIGtub3cgYWJvdXQgdGhpcy4NCj4+IA0KPj4gT2ssIEkgd2lsbCByZXBvcnQgdGhp
cyB0byB0aGUgY29tcGFueS4gQXQgdGhlIHNhbWUgdGltZSwgSSB3aWxsIGFkZCBhbiBhdWRpdCBt
ZWNoYW5pc20gdG8gdGhlIHBhdGNoIHN1Ym1pc3Npb24gcHJvY2Vzcy4gVGhhbmtzIGFnYWluIGZv
ciB5b3VyIHJlbWluZGVyLg0KPj4gDQo+PiBJIHdpbGwgcmVtb3ZlIHRoaXMgcGFydCBpbiBQQVRD
SCBWMTEuDQo+DQo+Tm8sIHlvdSB3aWxsIG5lZWQgdG8gZG8gdGhpcyBiZWZvcmUgd2UgY2FuIGFj
Y2VwdCB5b3VyIGNoYW5nZS4gIEFuZCBzb21lIHNvcnQgb2YgdmVyaWZpY2F0aW9uIHRoYXQgdGhp
cyBpcyBub3cgaW4gcGxhY2UgcHJvcGVybHkgZm9yIG9idmlvdXMgcmVhc29ucy4NCg0KV2hhdCBk
b2VzICJObyIgbWVhbj8gQXJlIHlvdSB0YWxraW5nIGFib3V0IGdpdmluZyBmZWVkYmFjayB0byB0
aGUgY29tcGFueSB0byBwcmV2ZW50IHRoaXMgaW5jaWRlbnQgZnJvbSBoYXBwZW5pbmc/IE9yIHN1
Ym1pdHRpbmcgUEFUQ0ggVjExPyBJZiBpdCdzIHRoZSBmb3JtZXIsIGhvdyBzaG91bGQgSSBnaXZl
IHlvdSBmZWVkYmFjaz8iDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
