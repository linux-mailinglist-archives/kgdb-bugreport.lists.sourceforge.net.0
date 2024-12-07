Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 062379E82B0
	for <lists+kgdb-bugreport@lfdr.de>; Sun,  8 Dec 2024 00:13:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tK3z8-0003x4-PM
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 07 Dec 2024 23:13:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1tK3z7-0003ww-2z
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 07 Dec 2024 23:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HspVnKDKVVVr7FO7xa5uCzBXD24/tOGH2qwRon8BIpU=; b=A9sgyQ1M3M/9TBsBk30ErwbjFF
 oHhHRH8Mi6Z/9GLr8kcmheuWEj+M1RmEOgmdbyxywkUR/Fs1DbdzWvDor+CHEfgH69y1pg3CIQ4fA
 H7kpMMWD0qylttxQl5ynczcVJlZQwi7f/pF5m93U6WzE3vOSuJUbuTEMOu6YqhY3Tntw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HspVnKDKVVVr7FO7xa5uCzBXD24/tOGH2qwRon8BIpU=; b=hM1rqTWRZg+M2dixgLGuMTuDBb
 Kxitz6uPJQYTc5uDNiPf1qrsOhKIyabhQGjeNRgMiyRZJDS8J1KxzW0wgryQ/LW3CT6HGCEUYdG17
 zbhWUJ1hlNdXSMxCgvxOtcSLkacI1xWPqyQvXDIexBw/EJDnh2cwYQMeULt+uWWwAuPY=;
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tK3z5-0000Ca-UV for kgdb-bugreport@lists.sourceforge.net;
 Sat, 07 Dec 2024 23:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=HspVnKDKVVVr7FO7xa5uCzBXD24/tOGH2qwRon8BIpU=; b=rQK3ofmJb75Hfz2E1lOQespsUR
 QDpOJ2tK1AMKVFw85EpB4psjJG3phra4wX5gvWtyEMqKXB8Keu63sN7isqaxDXKKPi8/1vUdL+0gk
 /bVRDqphIyVOTFOOFJGNo1ECRMe4Q2/bWqg7eJUYQ1uZB/ZxmYX1M6Q4ZKz0XtnOKOJXdtpJYAnsr
 xh6+qfPWLTHApJdKiTA0YsEWjOJME2X8MdhTetdiOitN8JTxWCBBYMiriyvlD+0m1XvAjZMjk8+2E
 8YN+lyjh/b8aFyZlxlnZsBO5GRRQZ5ZJAOTVw9mbjd+QQS4uPZ+7aH9T66wHCHwMK+Tg76WKERZhW
 T9kMnRCQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tK3xs-00000003Kza-2PJJ; Sat, 07 Dec 2024 23:12:54 +0000
Message-ID: <3be10d6b-e19e-4965-bac9-9af8b74fb566@infradead.org>
Date: Sat, 7 Dec 2024 15:11:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <87h67gu5q1.fsf@trenco.lwn.net>
 <0e5dbbbe-4cd8-49d2-a440-7e1acd7d40e9@infradead.org>
 <20241207085056.fcnoqov3kd5rjqft@basti-XPS-13-9310>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241207085056.fcnoqov3kd5rjqft@basti-XPS-13-9310>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/7/24 12:50 AM, Sebastian Fricke wrote: > Hey Randy,
 > > On 06.12.2024 15:57, Randy Dunlap wrote: >> >> >> On 12/6/24 8:38 AM,
 Jonathan Corbet wrote: >>> Randy Dunlap <rdunlap@infradead.org> writ [...]
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.92.199 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.92.199 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.92.199 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1tK3z5-0000Ca-UV
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: move dev-tools
 debugging files to process/debugging/
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
Cc: linux-doc@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Jonathan Corbet <corbet@lwn.net>, Daniel Thompson <danielt@kernel.org>,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

CgpPbiAxMi83LzI0IDEyOjUwIEFNLCBTZWJhc3RpYW4gRnJpY2tlIHdyb3RlOgo+IEhleSBSYW5k
eSwKPiAKPiBPbiAwNi4xMi4yMDI0IDE1OjU3LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+Cj4+Cj4+
IE9uIDEyLzYvMjQgODozOCBBTSwgSm9uYXRoYW4gQ29yYmV0IHdyb3RlOgo+Pj4gUmFuZHkgRHVu
bGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyaXRlczoKPj4+Cj4+Pj4gTW92ZSBnZGIgYW5k
IGtnZGIgZGVidWdnaW5nIGRvY3VtZW50YXRpb24gdG8gdGhlIGRlZGljYXRlZAo+Pj4+IGRlYnVn
Z2luZyBkaXJlY3RvcnkgKERvY3VtZW50YXRpb24vcHJvY2Vzcy9kZWJ1Z2dpbmcvKS4KPj4+PiBB
ZGp1c3QgdGhlIGluZGV4LnJzdCBmaWxlcyB0byBmb2xsb3cgdGhlIGZpbGUgbW92ZW1lbnQuCj4+
Pj4gVXBkYXRlIGxvY2F0aW9uIG9mIGtnZGIucnN0IGluIE1BSU5UQUlORVJTIGZpbGUuCj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4K
Pj4+Cj4+PiBTbyAuLi4gc2luY2UgdGhlc2UgYXJlIGluZGVlZCBkZXZlbG9wbWVudCB0b29scywg
SSB3b25kZXIgaWYgd2Ugc2hvdWxkCj4+PiBsZWF2ZSBhIHJlZmVyZW5jZSBiZWhpbmQgaW4gY2Fz
ZSBwZW9wbGUgYXJlIGxvb2tpbmcgZm9yIHRoZW0gdGhlcmU/Cj4+Cj4+IEFzIGZhciBhcyBJJ20g
Y29uY2VybmVkLCBhbGwgZGVidWcgdG9vbHMgYXJlIGRldmVsb3BtZW50IHRvb2xzLCBzbyBJJ20g
YmFjawo+PiB0byBhbGwgb2YgL3Byb2Nlc3MvZGVidWdnaW5nLyBzaG91bGQgYmUgc29tZXdoZXJl
IGVsc2UuwqAgOykKPiAKPiBJIG1lYW4gdGhpcyBpcyB3aGVyZSB0aGluZ3MganVzdCBzaW1wbHkg
b3ZlcmxhcCwgYmVjYXVzZSBkZWJ1Z2dpbmcgaXMKPiBwYXJ0IG9mIHRoZSBkZXZlbG9wbWVudCBw
cm9jZXNzIGFuZCBhbGwgZGVidWdnaW5nIHRvb2xzIGFyZSBkZXZlbG9wbWVudAo+IHRvb2xzLCBz
byBJIHRoaW5rIHRoZSBxdWVzdGlvbiBpcyBub3Qgd2hldGhlciBvbmUgb2YgdGhlIHR3byBwbGFj
ZXMgaXMKPiB0aGUgImNvcnJlY3QiIGJ1dCBpbnN0ZWFkIHRoZSB1c2VyIHNob3VsZCBiZSBhYmxl
IHRvIGZpbmQgdGhlIG5lY2Vzc2FyeQo+IGluZm9ybWF0aW9uIGJ5IG5hdmlnYXRpbmcgdG8gYW55
IG9mIHRoZSB0d28gcGxhY2VzLgo+IFNvIEkgd291bGQgc2F5LCBsZXRzIGFkZCBhIHJlZmVyZW5j
ZSBpbiB0aGUgaW5kZXggb2YgdGhlIGRldmVsb3BtZW50Cj4gdG9vbHMgdGhhdCBoaWdobGlnaHRz
IHRoZSBkb2N1bWVudGF0aW9uIG9mIHRoZSBkZWJ1Z2dpbmcgdG9vbHMgd2hpY2ggYXJlCj4gZm91
bmQgaW4gdGhlIGRldmVsb3BtZW50IHByb2Nlc3MgZG9jdW1lbnRhdGlvbi4KPiAKCkhpLAoKU3Vy
ZSwgSSB3aWxsIGFkZCBlbnRyaWVzIGluIGRldi10b29scy9pbmRleC4KClRoYW5rcy4KCi0tIAp+
UmFuZHkKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
S2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2Ri
LWJ1Z3JlcG9ydAo=
