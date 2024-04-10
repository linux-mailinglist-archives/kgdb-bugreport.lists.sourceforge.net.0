Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029E89EA33
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 07:55:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruQvx-0003jL-Lg
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 05:55:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1ruQvv-0003jD-9C
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 05:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=igMcFDMxvu2p9U20IbqyeRQJRA/g0Q0NAOMiAPdkpwM=; b=DCLMcedElFaZFtCxwxfod+dNo+
 HS13sIFJVGWeYKH0+LWMQ/sB18iZXlW9KZEAwJuqzT4XJLqvO6GBJHYPQc12ViNaZkGDzyZrOWrPK
 fhHI319wmGOE/5iAr/Irw/EViZDdM70pKoo1X8+XcM+q9OV5NuCvyc6AERGJVeuljnGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=igMcFDMxvu2p9U20IbqyeRQJRA/g0Q0NAOMiAPdkpwM=; b=Z4QRoJ83HvHY3smQ3Tn/IRJgGh
 /5HlOZGsRG5ed2oyg6uQNTTKEN1mS6dMP4fjgjP3QVT90jAJ9S4KxaZ5Vfcgvtb6ukjCDAWhVaxEF
 H4cBezxkAhix+v7rCppR7J/Y+HYLBJiUlEdIxBXw37yoWSOXD4CMDxdUW1blkiZn9ez4=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruQvf-00088E-Oi for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 05:55:43 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 43A5s7Wa084336;
 Wed, 10 Apr 2024 13:54:07 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX08-BJD.srv.huawei-3com.com (unknown [10.153.34.10])
 by mail.maildlp.com (Postfix) with ESMTP id CEF182004BC2;
 Wed, 10 Apr 2024 13:56:16 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX08-BJD.srv.huawei-3com.com (10.153.34.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Wed, 10 Apr 2024 13:54:08 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Wed, 10 Apr 2024 13:54:08 +0800
From: Liuye <liu.yeC@h3c.com>
To: Greg KH <gregkh@linuxfoundation.org>, "andy.shevchenko@gmail.com"
 <andy.shevchenko@gmail.com>
Thread-Topic: [PATCH V10] kdb: Fix the deadlock issue in KDB debugging.
Thread-Index: AQHaiuuw81gSSyk26Eq+v/7KfdTz2LFgdGkAgACJimA=
Date: Wed, 10 Apr 2024 05:54:08 +0000
Message-ID: <0c004dd44ad5478eba9451186f4ec962@h3c.com>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
 <2024041014-padlock-aggregate-4705@gregkh>
In-Reply-To: <2024041014-padlock-aggregate-4705@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 43A5s7Wa084336
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: >> Signed-off-by: Greg KH <gregkh@linuxfoundation.org> > >I
 have NOT signed off on this commit. You just said that I made a legal
 statement
 about this commit without that actually being true??? > >Sor [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
X-Headers-End: 1ruQvf-00088E-Oi
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogW1BBVENIIFYxMF0ga2RiOiBGaXgg?=
 =?gb2312?b?dGhlIGRlYWRsb2NrIGlzc3VlIGluIEtEQiBkZWJ1Z2dpbmcu?=
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
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Pj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
DQo+SSBoYXZlIE5PVCBzaWduZWQgb2ZmIG9uIHRoaXMgY29tbWl0LiAgWW91IGp1c3Qgc2FpZCB0
aGF0IEkgbWFkZSBhIGxlZ2FsIHN0YXRlbWVudCBhYm91dCB0aGlzIGNvbW1pdCB3aXRob3V0IHRo
YXQgYWN0dWFsbHkgYmVpbmcgdHJ1ZT8/Pw0KPg0KPlNvcnJ5LCBidXQgdGhhdCBpcyBmbGF0IG91
dCBub3QgYWNjZXB0YWJsZSBhdCBhbGwuICBQbGVhc2UgZ28gd29yayB3aXRoIHlvdXIgY29tcGFu
eSBsYXd5ZXJzIHRvIGZpZ3VyZSBvdXQgd2hhdCB5b3UgZGlkIGFuZCBjb21lIGJhY2sgd2l0aCBh
biBleHBsYWluYXRpb24gb2YgZXhhY3RseSB3aGF0IHRoaXMgaXMgYW5kIGhvdyBpdCB3aWxsIG5v
dCBoYXBwZW4gYWdhaW4uDQo+DQoNCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8
YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4NCj4+IFY5IC0+IFYxMCA6IEFkZCBTaWduZWQt
b2ZmLWJ5IG9mIEdyZWcgS0ggYW5kIEFuZHkgU2hldmNoZW5rbywgQWNrZWQtYnkgDQo+PiBvZiBE
YW5pZWwgVGhvbXBzb24NCj4NCj5IdWg/IQ0KDQpAZ3JlZyBrLWggo7oNCkBBbmR5IFNoZXZjaGVu
a28go7oNCg0KU29ycnksIGl0IHdhcyBteSBtaXN0YWtlLiBJIG1pc3VuZGVyc3Rvb2QgdGhlIG1l
YW5pbmcgb2YgInNpZ25lZC1vZmYtYnkiLCB3aGljaCBsZWQgdG8gdXNhZ2UgaXNzdWVzLg0KDQpJ
IHdhbnQgdG8gZXhwcmVzcyBteSBncmF0aXR1ZGUgZm9yIHRoZSBzdWdnZXN0aW9ucyBvbiB0aGUg
cGF0Y2ggZnJvbSB0aGUgdHdvIG9mIHlvdS4gDQoNCldoYXQgZG8gSSBuZWVkIHRvIGRvIG5vdz8g
UmVsZWFzZSBQQVRDSCBWMTEgYW5kIGRlbGV0ZSB0aGVzZSB0d28gc2lnbmF0dXJlcyBpbiBpdCA/
DQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1i
dWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3Jl
cG9ydAo=
