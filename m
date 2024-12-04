Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75A9E4874
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  5 Dec 2024 00:09:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tIyV9-0004hJ-74
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 04 Dec 2024 23:09:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1tIyV7-0004hC-E5
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 04 Dec 2024 23:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JzCDKZ+m2gij39VH+9wih/kCUTjcCYmukORmLFlMOS0=; b=AzfP2qsMzPMMKtv3KKWg5RZHYS
 G7W1X2471b4WLuAnV9ckZ7wTLvOL0MCCyMnFwwNeekT4W/x+W3dG9RSXdyx4322sstdm5droDyTqa
 Nl9ZoJfj/X93cE1GWfnvVmZFwfxwd/zSa5v0596Sb+kLboyJuDfNygKIhzDyM4ht8DkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JzCDKZ+m2gij39VH+9wih/kCUTjcCYmukORmLFlMOS0=; b=WZTpB9IZpbtWE9iWsPTEte8wLQ
 adnshJCy9ljzy58G8I9ADhJhZIZ/R/ch2d/iE0TdpKM6YBQgJfIFkornj9/t3Mnx/WfvyZa3enSN+
 6DMKvBTJ6xfyAvRiYiaVvPA8l6IFSTsuwZ6451oL5gugx1VMpYMDuqQKg+LVdKNwKP6s=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIyV4-0004Ub-9P for kgdb-bugreport@lists.sourceforge.net;
 Wed, 04 Dec 2024 23:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=JzCDKZ+m2gij39VH+9wih/kCUTjcCYmukORmLFlMOS0=; b=rX2mDLZKJMjO7+JtZe4Szz+Ege
 K5Nj0GZnUfdpQ1aFN6dDRaSGoYwu/mstgYi7tH/+Idswd95pkTotOH/cKy1nXVaD8unvh8heDsGpv
 RAcgcDoInHvE+gkkEWBLCyDRq+VMxgZjwYTJgKIKFFXKEhgz7HKCA+rupVyrZ1JIEyDDygWL7LKu2
 WZmf5m+9kfz/ULkkCXLCXu0A8C3JLQCAxIju+J9oigJboOGa4Qaqa8OTTI8Bja9dlglbv//8WxW5p
 SFaCQku6KKfltglAMRHeBK8R8mBjeADLltQ13B3JjOU9bV9l2THdp1glB6FBIFpjulIXHxcNHkUen
 Ii5GqfCA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tIyUj-0000000C8Gy-375D; Wed, 04 Dec 2024 23:09:23 +0000
Message-ID: <e3e78060-0939-4078-989c-acd7ca1c90d2@infradead.org>
Date: Wed, 4 Dec 2024 15:09:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Doug Anderson <dianders@chromium.org>
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/4/24 3:07 PM, Doug Anderson wrote: > Hi, > > On Wed,
    Dec 4, 2024 at 2:17 PM Randy Dunlap <rdunlap@infradead.org> wrote: >> >>
    Move gdb and kgdb debugging documentation to the dedicated >> debu [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [90.155.50.34 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [90.155.50.34 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [90.155.50.34 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1tIyV4-0004Ub-9P
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
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 linux-doc@vger.kernel.org, Daniel Thompson <danielt@kernel.org>,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

CgpPbiAxMi80LzI0IDM6MDcgUE0sIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4gCj4gT24g
V2VkLCBEZWMgNCwgMjAyNCBhdCAyOjE34oCvUE0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+IHdyb3RlOgo+Pgo+PiBNb3ZlIGdkYiBhbmQga2dkYiBkZWJ1Z2dpbmcgZG9jdW1l
bnRhdGlvbiB0byB0aGUgZGVkaWNhdGVkCj4+IGRlYnVnZ2luZyBkaXJlY3RvcnkgKERvY3VtZW50
YXRpb24vcHJvY2Vzcy9kZWJ1Z2dpbmcvKS4KPj4gQWRqdXN0IHRoZSBpbmRleC5yc3QgZmlsZXMg
dG8gZm9sbG93IHRoZSBmaWxlIG1vdmVtZW50Lgo+PiBVcGRhdGUgbG9jYXRpb24gb2Yga2dkYi5y
c3QgaW4gTUFJTlRBSU5FUlMgZmlsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFw
IDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4+IENjOiBTZWJhc3RpYW4gRnJpY2tlIDxzZWJhc3Rp
YW4uZnJpY2tlQGNvbGxhYm9yYS5jb20+Cj4+IENjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBs
d24ubmV0Pgo+PiBDYzogd29ya2Zsb3dzQHZnZXIua2VybmVsLm9yZwo+PiBDYzogSmFzb24gV2Vz
c2VsIDxqYXNvbi53ZXNzZWxAd2luZHJpdmVyLmNvbT4KPj4gQ2M6IERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsdEBrZXJuZWwub3JnPgo+PiBDYzogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPgo+PiBDYzogbGludXgtZGVidWdnZXJzQHZnZXIua2VybmVsLm9yZwo+PiBDYzog
a2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IC0tLQo+PiAgRG9jdW1lbnRh
dGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyIC0tCj4+ICBEb2N1bWVudGF0aW9uL3tkZXYtdG9vbHMgPT4gcHJvY2Vzcy9kZWJ1
Z2dpbmd9L2dkYi1rZXJuZWwtZGVidWdnaW5nLnJzdCB8IDAKPiAKPiBBZnRlciBhcHBseWluZyB5
b3VyIHBhdGNoIGFuZCBkb2luZyBgZ2l0IGdyZXAKPiBnZGIta2VybmVsLWRlYnVnZ2luZy5yc3Rg
LCBJIHN0aWxsIHNlZSBzZXZlcmFsIHJlZmVyZW5jZXMgdG8gdGhlIG9sZAo+IGxvY2F0aW9uLiBU
aG9zZSBzaG91bGQgYmUgdXBkYXRlZCBhcyBwYXJ0IG9mIHRoaXMgcGF0Y2gsIHJpZ2h0Pwo+IAo+
IAo+IAo+PiAgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy9pbmRleC5yc3QgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICsrCj4+ICBEb2N1bWVudGF0aW9uL3tkZXYtdG9v
bHMgPT4gcHJvY2Vzcy9kZWJ1Z2dpbmd9L2tnZGIucnN0ICAgICAgICAgICAgICAgICB8IDAKPiAK
PiBTaW1pbGFybHkgYGdpdCBncmVwIGtnZGIucnN0YCBzdGlsbCBoYXMgc2V2ZXJhbCByZWZlcmVu
Y2VzIHRvIHRoZSBvbGQgbG9jYXRpb24uCgoKVGhhbmtzLiBJIHNob3VsZCBoYXZlIGRvbmUgdGhh
dC4gIDooCgo+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4+ICA1IGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2LXRvb2xzL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2luZGV4
LnJzdAo+PiBpbmRleCAzYzBhYzA4YjI3MDkuLmMxZTczZTc1ZjU1MSAxMDA2NDQKPj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2LXRvb2xzL2luZGV4LnJzdAo+PiBAQCAtMjcsOCArMjcsNiBAQCBEb2N1bWVudGF0aW9uL2Rl
di10b29scy90ZXN0aW5nLW92ZXJ2aWV3LnJzdAo+PiAgICAga21lbWxlYWsKPj4gICAgIGtjc2Fu
Cj4+ICAgICBrZmVuY2UKPj4gLSAgIGdkYi1rZXJuZWwtZGVidWdnaW5nCj4+IC0gICBrZ2RiCj4+
ICAgICBrc2VsZnRlc3QKPj4gICAgIGt1bml0L2luZGV4Cj4+ICAgICBrdGFwCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9nZGIta2VybmVsLWRlYnVnZ2luZy5yc3QgYi9E
b2N1bWVudGF0aW9uL3Byb2Nlc3MvZGVidWdnaW5nL2dkYi1rZXJuZWwtZGVidWdnaW5nLnJzdAo+
PiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPj4gcmVuYW1lIGZyb20gRG9jdW1lbnRhdGlvbi9kZXYt
dG9vbHMvZ2RiLWtlcm5lbC1kZWJ1Z2dpbmcucnN0Cj4+IHJlbmFtZSB0byBEb2N1bWVudGF0aW9u
L3Byb2Nlc3MvZGVidWdnaW5nL2dkYi1rZXJuZWwtZGVidWdnaW5nLnJzdAo+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0
aW9uL3Byb2Nlc3MvZGVidWdnaW5nL2luZGV4LnJzdAo+PiBpbmRleCBmNmU0YTAwZGZlZTMuLmJj
NGE4MTZlM2QzMiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2lu
Zy9pbmRleC5yc3QKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy9pbmRl
eC5yc3QKPj4gQEAgLTEyLDYgKzEyLDggQEAgZ2VuZXJhbCBndWlkZXMKPj4KPj4gICAgIGRyaXZl
cl9kZXZlbG9wbWVudF9kZWJ1Z2dpbmdfZ3VpZGUKPj4gICAgIHVzZXJzcGFjZV9kZWJ1Z2dpbmdf
Z3VpZGUKPj4gKyAgIGdkYi1rZXJuZWwtZGVidWdnaW5nCj4+ICsgICBrZ2RiCj4gCj4gU2hvdWxk
IHRoZSBsaXN0IGFib3ZlIGJlIGtlcHQgYWxwaGFiZXRpY2FsLiBUaGUgbGlzdCB5b3UgcmVtb3Zl
ZCB0aGVzZQo+IGVudHJpZXMgZnJvbSB3YXMgX2FsbW9zdF8gYWxwaGFiZXRpY2FsLi4uCgpOb3Qg
dGhhdCBJIGtub3cgb2YuICBJJ2xsIGxpc3RlbiBmb3Igb3RoZXIgb3BpbmlvbnMgdGhvdWdoLgoK
VGhhbmtzLgoKLS0gCn5SYW5keQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
