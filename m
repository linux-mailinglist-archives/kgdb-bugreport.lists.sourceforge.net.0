Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984789ED83
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 10:24:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruTGK-0005vb-EY
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 08:24:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ruTGH-0005vR-CC
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 08:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uhaFy06Bn0XaStgXD8ypJbvBUEMEzyVp89+SDG8uTYw=; b=Hb5Dqz5Ip1wqAR5t3gmLqHMf+Z
 tU6V6qBOdwTSs8Pj3XnZjRwg9i3laubSXR/F5A14XMvy7sYufi/Cb+9Ug3LahpxYBEnPErEuqZkZT
 Bfvjy7YXnpnmnalykCOhWoqqZrQbfIwvM6rAcS0lRUBqC62n7ZjC0S7u8OW5q2+n7cGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uhaFy06Bn0XaStgXD8ypJbvBUEMEzyVp89+SDG8uTYw=; b=Iy9YJP0BT4MPjZ/Xh/sRcWdair
 hjB60U1sADwWmtabMUirH/mBrLQXY6RCBv7E2GCsrALWDlmhp7+ooqH2cVIq0KCLggSiMPCDKzTO0
 gsjkbKGntHxutiRrZVmoguwIS0FjvmFb4gNXlJqMSzuTxBBuOoI/E8iUtfPfyivClxAQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruTGG-0003Ak-PF for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 08:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42624CE2645;
 Wed, 10 Apr 2024 08:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC710C433C7;
 Wed, 10 Apr 2024 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712737480;
 bh=kHw62uWAIH9xVgzosFJdAHEiAM9foucIVnPx0iW+bEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uylqAdnIIwZqjIaaS86WJ3YQSmqVYxMIAWLIMPG5xNLG8NrPCeZw1zm1jIzR5vKsL
 /Y4oYPGk2/TiofuPBM7m2TdHICVpdGkS0mV9v73j4DDk6/JCJEzObRVMCZ1gEQQnbU
 7EmGb8RRTa0mMAw2WGdDW1m7LRFPg/hyDb/8SnOY=
Date: Wed, 10 Apr 2024 10:24:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <2024041007-busload-equipment-b673@gregkh>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
 <2024041014-padlock-aggregate-4705@gregkh>
 <0c004dd44ad5478eba9451186f4ec962@h3c.com>
 <2024041001-retaliate-cork-1fe5@gregkh>
 <5c659d5f41ff4cf69ea9467b62d74e9b@h3c.com>
 <2024041022-electable-unblock-5077@gregkh>
 <567857bab013409ca53fa7c36292f4b0@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <567857bab013409ca53fa7c36292f4b0@h3c.com>
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 10, 2024 at 06:30:59AM +0000, Liuye wrote: > >On
 Wed, Apr 10, 2024 at 06:10:10AM +0000, Liuye wrote: > >> >On Wed, Apr 10,
 2024 at 05:54:08AM +0000, Liuye wrote: > >> >> >> Signed-off-by: [...] 
 Content analysis details:   (-7.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruTGG-0003Ak-PF
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BB?=
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDY6MzA6NTlBTSArMDAwMCwgTGl1eWUgd3JvdGU6Cj4g
Pk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA2OjEwOjEwQU0gKzAwMDAsIExpdXllIHdyb3RlOgo+
ID4+ID5PbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAwNTo1NDowOEFNICswMDAwLCBMaXV5ZSB3cm90
ZToKPiA+PiA+PiA+PiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiA+PiA+PiA+Cj4gPj4gPj4gPkkgaGF2ZSBOT1Qgc2lnbmVkIG9mZiBvbiB0aGlz
IGNvbW1pdC4gIFlvdSBqdXN0IHNhaWQgdGhhdCBJIG1hZGUgYSBsZWdhbCBzdGF0ZW1lbnQgYWJv
dXQgdGhpcyBjb21taXQgd2l0aG91dCB0aGF0IGFjdHVhbGx5IGJlaW5nIHRydWU/Pz8KPiA+PiA+
PiA+Cj4gPj4gPj4gPlNvcnJ5LCBidXQgdGhhdCBpcyBmbGF0IG91dCBub3QgYWNjZXB0YWJsZSBh
dCBhbGwuICBQbGVhc2UgZ28gd29yayB3aXRoIHlvdXIgY29tcGFueSBsYXd5ZXJzIHRvIGZpZ3Vy
ZSBvdXQgd2hhdCB5b3UgZGlkIGFuZCBjb21lIGJhY2sgd2l0aCBhbiBleHBsYWluYXRpb24gb2Yg
ZXhhY3RseSB3aGF0IHRoaXMgaXMgYW5kIGhvdyBpdCB3aWxsIG5vdCBoYXBwZW4gYWdhaW4uCj4g
Pj4gPj4gPgo+ID4+ID4+IAo+ID4+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5r
byA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4KPiA+PiA+PiA+Cj4gPj4gPj4gPj4gVjkgLT4g
VjEwIDogQWRkIFNpZ25lZC1vZmYtYnkgb2YgR3JlZyBLSCBhbmQgQW5keSBTaGV2Y2hlbmtvLCAK
PiA+PiA+PiA+PiBBY2tlZC1ieSBvZiBEYW5pZWwgVGhvbXBzb24KPiA+PiA+PiA+Cj4gPj4gPj4g
Pkh1aD8hCj4gPj4gPj4gCj4gPj4gPj4gQGdyZWcgay1oIO+8mgo+ID4+ID4+IEBBbmR5IFNoZXZj
aGVua28g77yaCj4gPj4gPj4gCj4gPj4gPj4gU29ycnksIGl0IHdhcyBteSBtaXN0YWtlLiBJIG1p
c3VuZGVyc3Rvb2QgdGhlIG1lYW5pbmcgb2YgInNpZ25lZC1vZmYtYnkiLCB3aGljaCBsZWQgdG8g
dXNhZ2UgaXNzdWVzLgo+ID4+ID4+IAo+ID4+ID4+IEkgd2FudCB0byBleHByZXNzIG15IGdyYXRp
dHVkZSBmb3IgdGhlIHN1Z2dlc3Rpb25zIG9uIHRoZSBwYXRjaCBmcm9tIHRoZSB0d28gb2YgeW91
LiAKPiA+PiA+PiAKPiA+PiA+PiBXaGF0IGRvIEkgbmVlZCB0byBkbyBub3c/IFJlbGVhc2UgUEFU
Q0ggVjExIGFuZCBkZWxldGUgdGhlc2UgdHdvIHNpZ25hdHVyZXMgaW4gaXQgPwo+ID4+ID4KPiA+
PiA+QXMgSSBzYWlkLCBnbyB3b3JrIHdpdGggeW91ciBjb3Jwb3JhdGUgbGF3eWVycyBvbiB0aGlz
IHRvIHVuZGVyc3RhbmQgd2hhdCBqdXN0IGhhcHBlbmVkIGFuZCBoYXZlIHRoZW0gbGV0IHVzIGtu
b3cgaG93IGl0IHdpbGwgbm90IGhhcHBlbiBhZ2Fpbi4KPiA+PiAKPiA+PiBJJ20gdmVyeSBzb3Jy
eSwgdGhpcyBpcyBteSBmaXJzdCB0aW1lIHN1Ym1pdHRpbmcgYSBwYXRjaCBhbmQgSSBtYWRlIGEg
c2lnbmlmaWNhbnQgbWlzdGFrZSBpbiB1c2luZyAiU2lnbmVkLW9mZi1ieSIuIEkgbm93IHVuZGVy
c3RhbmQgdGhlIG1lYW5pbmcgb2YgdGhpcyBmaWVsZCBhbmQgd2lsbCBub3QgbWFrZSB0aGUgc2Ft
ZSBtaXN0YWtlIGFnYWluIGluIHRoZSBmdXR1cmUuCj4gPgo+ID5VbmRlcnN0b29kLCBidXQgeW91
IHN0aWxsIG5lZWQgdG8gZ28gd29yayB3aXRoIHlvdXIgY29ycG9yYXRlIGxlZ2FsIGdyb3VwIHNv
IHRoYXQgeW91IGFsbCBlbnN1cmUgdGhpcyBkb2VzIG5vdCBoYXBwZW4gYWdhaW4gZm9yIGFueSBv
dGhlciBkZXZlbG9wZXIgaW4geW91ciBjb21wYW55LCBhcyBJIGFtIHN1cmUgdGhleSB3aWxsIHdh
bnQgdG8ga25vdyBhYm91dCB0aGlzLgo+IAo+IE9rLCBJIHdpbGwgcmVwb3J0IHRoaXMgdG8gdGhl
IGNvbXBhbnkuIEF0IHRoZSBzYW1lIHRpbWUsIEkgd2lsbCBhZGQgYW4gYXVkaXQgbWVjaGFuaXNt
IHRvIHRoZSBwYXRjaCBzdWJtaXNzaW9uIHByb2Nlc3MuIFRoYW5rcyBhZ2FpbiBmb3IgeW91ciBy
ZW1pbmRlci4KPiAKPiBJIHdpbGwgcmVtb3ZlIHRoaXMgcGFydCBpbiBQQVRDSCBWMTEuCgpObywg
eW91IHdpbGwgbmVlZCB0byBkbyB0aGlzIGJlZm9yZSB3ZSBjYW4gYWNjZXB0IHlvdXIgY2hhbmdl
LiAgQW5kIHNvbWUKc29ydCBvZiB2ZXJpZmljYXRpb24gdGhhdCB0aGlzIGlzIG5vdyBpbiBwbGFj
ZSBwcm9wZXJseSBmb3Igb2J2aW91cwpyZWFzb25zLgoKdGhhbmtzLAoKZ3JlZyBrLWgKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9y
dCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
