Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56989EA71
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 08:11:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruRB8-0004D2-V3
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 06:11:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1ruRB6-0004Cv-TT
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUwUVEB5nJCdcq7xQJGKXu20SVViDzFPOHwvow6ztcQ=; b=mUelKPc9yLbO0EZNzBzpJ4hQaz
 6qJ63jT1iZxUVJamN7ZEnmXd3Cj1ysRJoZ+tj/GSg1Rn8FDKiSUn+OgUV4XZeD89DHCY4YOONKJ37
 km8uSOhz/UwyEDNAWgM9ZQvyMdkvVqrvYCuL2r36q+pXPQ+Us36V7U+4tl6FJDR2M5Uc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pUwUVEB5nJCdcq7xQJGKXu20SVViDzFPOHwvow6ztcQ=; b=D9vril1j0NV8v7D/93R76T68na
 sZqinkeqAxbs4UeL8v1+SUOOcSChurUYKdBR8yNEAkrCOPCchyaf1Zsyvdy0EldNmJzdnRIahT826
 YaDxpXqyK1bUNDU0v54tCfkWXu8ShX6WeWQtHRcdxUL1Wc/+HKevT2GHsMrdW3gR78UY=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruRAr-0000uO-AZ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:11:24 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 43A6A82D070683;
 Wed, 10 Apr 2024 14:10:08 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (unknown [10.62.14.11])
 by mail.maildlp.com (Postfix) with ESMTP id 90AF92004BA6;
 Wed, 10 Apr 2024 14:12:18 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Wed, 10 Apr 2024 14:10:10 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Wed, 10 Apr 2024 14:10:10 +0800
From: Liuye <liu.yeC@h3c.com>
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0ggVjEwXSBrZGI6IEZpeCB0aGUgZGVhZGxvY2sgaXNz?=
 =?utf-8?Q?ue_in_KDB_debugging.?=
Thread-Index: AQHaiuuw81gSSyk26Eq+v/7KfdTz2LFgdGkAgACJimD//36cAIAAh7Hw
Date: Wed, 10 Apr 2024 06:10:10 +0000
Message-ID: <5c659d5f41ff4cf69ea9467b62d74e9b@h3c.com>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
 <2024041014-padlock-aggregate-4705@gregkh>
 <0c004dd44ad5478eba9451186f4ec962@h3c.com>
 <2024041001-retaliate-cork-1fe5@gregkh>
In-Reply-To: <2024041001-retaliate-cork-1fe5@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 43A6A82D070683
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On Wed, Apr 10, 2024 at 05:54:08AM +0000, Liuye wrote: >>
 >> Signed-off-by: Greg KH <gregkh@linuxfoundation.org> >> > >> >I have NOT
 signed off on this commit. You just said that I made a legal state [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
X-Headers-End: 1ruRAr-0000uO-AZ
Subject: [Kgdb-bugreport] =?utf-8?b?562U5aSNOiDnrZTlpI06IFtQQVRDSCBWMTBd?=
 =?utf-8?q?_kdb=3A_Fix_the_deadlock_issue_in_KDB_debugging=2E?=
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

Pk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA1OjU0OjA4QU0gKzAwMDAsIExpdXllIHdyb3RlOg0K
Pj4gPj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
DQo+PiA+DQo+PiA+SSBoYXZlIE5PVCBzaWduZWQgb2ZmIG9uIHRoaXMgY29tbWl0LiAgWW91IGp1
c3Qgc2FpZCB0aGF0IEkgbWFkZSBhIGxlZ2FsIHN0YXRlbWVudCBhYm91dCB0aGlzIGNvbW1pdCB3
aXRob3V0IHRoYXQgYWN0dWFsbHkgYmVpbmcgdHJ1ZT8/Pw0KPj4gPg0KPj4gPlNvcnJ5LCBidXQg
dGhhdCBpcyBmbGF0IG91dCBub3QgYWNjZXB0YWJsZSBhdCBhbGwuICBQbGVhc2UgZ28gd29yayB3
aXRoIHlvdXIgY29tcGFueSBsYXd5ZXJzIHRvIGZpZ3VyZSBvdXQgd2hhdCB5b3UgZGlkIGFuZCBj
b21lIGJhY2sgd2l0aCBhbiBleHBsYWluYXRpb24gb2YgZXhhY3RseSB3aGF0IHRoaXMgaXMgYW5k
IGhvdyBpdCB3aWxsIG5vdCBoYXBwZW4gYWdhaW4uDQo+PiA+DQo+PiANCj4+ID4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4+ID4N
Cj4+ID4+IFY5IC0+IFYxMCA6IEFkZCBTaWduZWQtb2ZmLWJ5IG9mIEdyZWcgS0ggYW5kIEFuZHkg
U2hldmNoZW5rbywgDQo+PiA+PiBBY2tlZC1ieSBvZiBEYW5pZWwgVGhvbXBzb24NCj4+ID4NCj4+
ID5IdWg/IQ0KPj4gDQo+PiBAZ3JlZyBrLWgg77yaDQo+PiBAQW5keSBTaGV2Y2hlbmtvIO+8mg0K
Pj4gDQo+PiBTb3JyeSwgaXQgd2FzIG15IG1pc3Rha2UuIEkgbWlzdW5kZXJzdG9vZCB0aGUgbWVh
bmluZyBvZiAic2lnbmVkLW9mZi1ieSIsIHdoaWNoIGxlZCB0byB1c2FnZSBpc3N1ZXMuDQo+PiAN
Cj4+IEkgd2FudCB0byBleHByZXNzIG15IGdyYXRpdHVkZSBmb3IgdGhlIHN1Z2dlc3Rpb25zIG9u
IHRoZSBwYXRjaCBmcm9tIHRoZSB0d28gb2YgeW91LiANCj4+IA0KPj4gV2hhdCBkbyBJIG5lZWQg
dG8gZG8gbm93PyBSZWxlYXNlIFBBVENIIFYxMSBhbmQgZGVsZXRlIHRoZXNlIHR3byBzaWduYXR1
cmVzIGluIGl0ID8NCj4NCj5BcyBJIHNhaWQsIGdvIHdvcmsgd2l0aCB5b3VyIGNvcnBvcmF0ZSBs
YXd5ZXJzIG9uIHRoaXMgdG8gdW5kZXJzdGFuZCB3aGF0IGp1c3QgaGFwcGVuZWQgYW5kIGhhdmUg
dGhlbSBsZXQgdXMga25vdyBob3cgaXQgd2lsbCBub3QgaGFwcGVuIGFnYWluLg0KDQpJJ20gdmVy
eSBzb3JyeSwgdGhpcyBpcyBteSBmaXJzdCB0aW1lIHN1Ym1pdHRpbmcgYSBwYXRjaCBhbmQgSSBt
YWRlIGEgc2lnbmlmaWNhbnQgbWlzdGFrZSBpbiB1c2luZyAiU2lnbmVkLW9mZi1ieSIuIEkgbm93
IHVuZGVyc3RhbmQgdGhlIG1lYW5pbmcgb2YgdGhpcyBmaWVsZCBhbmQgd2lsbCBub3QgbWFrZSB0
aGUgc2FtZSBtaXN0YWtlIGFnYWluIGluIHRoZSBmdXR1cmUuDQoNClRoYW5rc++8jA0KTGl1IFll
DQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1i
dWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3Jl
cG9ydAo=
