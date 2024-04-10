Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210589EAE5
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 08:32:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruRVQ-0004nv-Hj
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 06:32:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1ruRVN-0004nl-KU
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pGvxBubreliBepPTNBS2k6SqYHRlWHDZe4Zl/3HRKZI=; b=JPrq0h5HSGEY5WkAC3Z2fUN/15
 LcC/gMmJTCI7GEhsBhEEpT5duLBaRV2ncimvPAaDr7+6nQjb7ERZMS48WtrDF+BIR3hKEpc3zkiw9
 iaXrNPsNb+jKWvosz4UEs6gTTnE81AW34k9KC5kkbIjef1MbnkvSfqpNflyTmxH3Tduw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pGvxBubreliBepPTNBS2k6SqYHRlWHDZe4Zl/3HRKZI=; b=mzhcN1tdeKeTGJViQeaNIGbKyB
 RvvVFC5UAviDJTHSeicSNjA2yMbm3a9q6h4BR0nr6rtiHTgJ6AsDq3sF2cfPBz7AyMMqRDCuDbBb7
 Eh18mqm05eLxz06NB1dZNixCCusCGRLlwoka8GDdWtPidMbKNK2qGCfG1ISGm3oPDTnE=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruRV8-0002UY-Ad for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:32:21 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 43A6Uv1R068148;
 Wed, 10 Apr 2024 14:30:57 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX10-BJD.srv.huawei-3com.com (unknown [10.153.34.12])
 by mail.maildlp.com (Postfix) with ESMTP id BC1FD2006135;
 Wed, 10 Apr 2024 14:33:07 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX10-BJD.srv.huawei-3com.com (10.153.34.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Wed, 10 Apr 2024 14:30:59 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Wed, 10 Apr 2024 14:30:59 +0800
From: Liuye <liu.yeC@h3c.com>
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSCBWMTBdIGtkYjogRml4IHRoZSBkZWFk?=
 =?utf-8?Q?lock_issue_in_KDB_debugging.?=
Thread-Index: AQHaiuuw81gSSyk26Eq+v/7KfdTz2LFgdGkAgACJimD//36cAIAAh7Hw//98qQCAAIohAA==
Date: Wed, 10 Apr 2024 06:30:59 +0000
Message-ID: <567857bab013409ca53fa7c36292f4b0@h3c.com>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
 <2024041014-padlock-aggregate-4705@gregkh>
 <0c004dd44ad5478eba9451186f4ec962@h3c.com>
 <2024041001-retaliate-cork-1fe5@gregkh>
 <5c659d5f41ff4cf69ea9467b62d74e9b@h3c.com>
 <2024041022-electable-unblock-5077@gregkh>
In-Reply-To: <2024041022-electable-unblock-5077@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 43A6Uv1R068148
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On Wed, Apr 10, 2024 at 06:10:10AM +0000, Liuye wrote: >>
 >On Wed, Apr 10, 2024 at 05:54:08AM +0000, Liuye wrote: >> >> >> Signed-off-by:
 Greg KH <gregkh@linuxfoundation.org> >> >> > >> >> >I have NO [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
X-Headers-End: 1ruRV8-0002UY-Ad
Subject: [Kgdb-bugreport] =?utf-8?b?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BB?=
 =?utf-8?q?TCH_V10=5D_kdb=3A_Fix_the_deadlock_issue_in_KDB_debugging=2E?=
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

Pk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA2OjEwOjEwQU0gKzAwMDAsIExpdXllIHdyb3RlOg0K
Pj4gPk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA1OjU0OjA4QU0gKzAwMDAsIExpdXllIHdyb3Rl
Og0KPj4gPj4gPj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+DQo+PiA+PiA+DQo+PiA+PiA+SSBoYXZlIE5PVCBzaWduZWQgb2ZmIG9uIHRoaXMgY29t
bWl0LiAgWW91IGp1c3Qgc2FpZCB0aGF0IEkgbWFkZSBhIGxlZ2FsIHN0YXRlbWVudCBhYm91dCB0
aGlzIGNvbW1pdCB3aXRob3V0IHRoYXQgYWN0dWFsbHkgYmVpbmcgdHJ1ZT8/Pw0KPj4gPj4gPg0K
Pj4gPj4gPlNvcnJ5LCBidXQgdGhhdCBpcyBmbGF0IG91dCBub3QgYWNjZXB0YWJsZSBhdCBhbGwu
ICBQbGVhc2UgZ28gd29yayB3aXRoIHlvdXIgY29tcGFueSBsYXd5ZXJzIHRvIGZpZ3VyZSBvdXQg
d2hhdCB5b3UgZGlkIGFuZCBjb21lIGJhY2sgd2l0aCBhbiBleHBsYWluYXRpb24gb2YgZXhhY3Rs
eSB3aGF0IHRoaXMgaXMgYW5kIGhvdyBpdCB3aWxsIG5vdCBoYXBwZW4gYWdhaW4uDQo+PiA+PiA+
DQo+PiA+PiANCj4+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5z
aGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4+ID4+ID4NCj4+ID4+ID4+IFY5IC0+IFYxMCA6IEFkZCBT
aWduZWQtb2ZmLWJ5IG9mIEdyZWcgS0ggYW5kIEFuZHkgU2hldmNoZW5rbywgDQo+PiA+PiA+PiBB
Y2tlZC1ieSBvZiBEYW5pZWwgVGhvbXBzb24NCj4+ID4+ID4NCj4+ID4+ID5IdWg/IQ0KPj4gPj4g
DQo+PiA+PiBAZ3JlZyBrLWgg77yaDQo+PiA+PiBAQW5keSBTaGV2Y2hlbmtvIO+8mg0KPj4gPj4g
DQo+PiA+PiBTb3JyeSwgaXQgd2FzIG15IG1pc3Rha2UuIEkgbWlzdW5kZXJzdG9vZCB0aGUgbWVh
bmluZyBvZiAic2lnbmVkLW9mZi1ieSIsIHdoaWNoIGxlZCB0byB1c2FnZSBpc3N1ZXMuDQo+PiA+
PiANCj4+ID4+IEkgd2FudCB0byBleHByZXNzIG15IGdyYXRpdHVkZSBmb3IgdGhlIHN1Z2dlc3Rp
b25zIG9uIHRoZSBwYXRjaCBmcm9tIHRoZSB0d28gb2YgeW91LiANCj4+ID4+IA0KPj4gPj4gV2hh
dCBkbyBJIG5lZWQgdG8gZG8gbm93PyBSZWxlYXNlIFBBVENIIFYxMSBhbmQgZGVsZXRlIHRoZXNl
IHR3byBzaWduYXR1cmVzIGluIGl0ID8NCj4+ID4NCj4+ID5BcyBJIHNhaWQsIGdvIHdvcmsgd2l0
aCB5b3VyIGNvcnBvcmF0ZSBsYXd5ZXJzIG9uIHRoaXMgdG8gdW5kZXJzdGFuZCB3aGF0IGp1c3Qg
aGFwcGVuZWQgYW5kIGhhdmUgdGhlbSBsZXQgdXMga25vdyBob3cgaXQgd2lsbCBub3QgaGFwcGVu
IGFnYWluLg0KPj4gDQo+PiBJJ20gdmVyeSBzb3JyeSwgdGhpcyBpcyBteSBmaXJzdCB0aW1lIHN1
Ym1pdHRpbmcgYSBwYXRjaCBhbmQgSSBtYWRlIGEgc2lnbmlmaWNhbnQgbWlzdGFrZSBpbiB1c2lu
ZyAiU2lnbmVkLW9mZi1ieSIuIEkgbm93IHVuZGVyc3RhbmQgdGhlIG1lYW5pbmcgb2YgdGhpcyBm
aWVsZCBhbmQgd2lsbCBub3QgbWFrZSB0aGUgc2FtZSBtaXN0YWtlIGFnYWluIGluIHRoZSBmdXR1
cmUuDQo+DQo+VW5kZXJzdG9vZCwgYnV0IHlvdSBzdGlsbCBuZWVkIHRvIGdvIHdvcmsgd2l0aCB5
b3VyIGNvcnBvcmF0ZSBsZWdhbCBncm91cCBzbyB0aGF0IHlvdSBhbGwgZW5zdXJlIHRoaXMgZG9l
cyBub3QgaGFwcGVuIGFnYWluIGZvciBhbnkgb3RoZXIgZGV2ZWxvcGVyIGluIHlvdXIgY29tcGFu
eSwgYXMgSSBhbSBzdXJlIHRoZXkgd2lsbCB3YW50IHRvIGtub3cgYWJvdXQgdGhpcy4NCg0KT2ss
IEkgd2lsbCByZXBvcnQgdGhpcyB0byB0aGUgY29tcGFueS4gQXQgdGhlIHNhbWUgdGltZSwgSSB3
aWxsIGFkZCBhbiBhdWRpdCBtZWNoYW5pc20gdG8gdGhlIHBhdGNoIHN1Ym1pc3Npb24gcHJvY2Vz
cy4gVGhhbmtzIGFnYWluIGZvciB5b3VyIHJlbWluZGVyLg0KDQpJIHdpbGwgcmVtb3ZlIHRoaXMg
cGFydCBpbiBQQVRDSCBWMTEuDQoNClRoYW5rc++8jA0KTGl1IFllDQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBs
aXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
