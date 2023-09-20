Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A597A7E4F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 Sep 2023 14:17:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qiw8k-0002sP-TO
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 20 Sep 2023 12:17:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1qiw8i-0002sH-Uk
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 20 Sep 2023 12:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v5xcG+pg3ggPPiHzf1hL2muaBJy0Lc1rt0ORYdQHbrg=; b=kDgg8wkJ7kUvnYcPB6pbkiYIbu
 CDaghTpHIAZ2UyAPpZyBS0sMQmLMUBT9P7h7Y9zMb65hvIX/ImopOtPAbPzZHsdo9gdLUkWoRWv76
 i2M5EbwpuUP1RQqS4ewdGBs486hGhe6IOiXZT32r86LKjkg08pIN00FOBGt2GtTOf+XM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v5xcG+pg3ggPPiHzf1hL2muaBJy0Lc1rt0ORYdQHbrg=; b=SMmO4P5b7+qwTQ6J2bmrGeEbAE
 6uZuEIguJJ84k600iS/GWtHyc5ZNE7F5J5xKwxHa/5CWsKuvZxBca4Z6rqbwn47yhPAhQATdjs5Fe
 gin0uYH00Q25emc23BpXCQRyFXPNQjzvsU6XdStvnRM/gb5imN+6vZRnyzeebYdfgriM=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qiw8c-0002TY-Km for kgdb-bugreport@lists.sourceforge.net;
 Wed, 20 Sep 2023 12:17:07 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4C8D521C2E;
 Wed, 20 Sep 2023 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1695211291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5xcG+pg3ggPPiHzf1hL2muaBJy0Lc1rt0ORYdQHbrg=;
 b=P85aQFX+7HY80Y6OsnPhF7kbTjbzj1nmeSmY/5H3Q0g/IDOJhi2y/EEK1ZTJitrMfJoJOJ
 2s9lNkdsGHu86HqD7nmOXVcvCO5jIhl6OmGd6U0SIruLm+F/vK7ntjEGnnrOHsSv9f0wqi
 MmnLsRbZol6W7y3o0lJwit/xYvgFxNg=
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DF1B12C142;
 Wed, 20 Sep 2023 12:01:30 +0000 (UTC)
Date: Wed, 20 Sep 2023 14:01:30 +0200
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <ZQrfGho-M9ZHQe9F@alley>
References: <20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid>
 <20230825100854.GC270740@aspen.lan>
 <CAD=FV=VHa1arysMgqZcGFGFi2N8i0BeKWD6BM8dSsg0Xq2LUFQ@mail.gmail.com>
 <20230830095359.GA44243@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830095359.GA44243@aspen.lan>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed 2023-08-30 10:53:59, Daniel Thompson wrote: > On Fri,
    Aug 25, 2023 at 07:18:44AM -0700, Doug Anderson wrote: > > Hi, > > > > On
    Fri, Aug 25, 2023 at 3:09 AM Daniel Thompson > > <daniel.thomps [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1qiw8c-0002TY-Km
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Flush console before entering
 kgdb on panic
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkIDIwMjMtMDgtMzAgMTA6NTM6NTksIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiBPbiBG
cmksIEF1ZyAyNSwgMjAyMyBhdCAwNzoxODo0NEFNIC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3Rl
Ogo+ID4gSGksCj4gPgo+ID4gT24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgMzowOeKAr0FNIERhbmll
bCBUaG9tcHNvbgo+ID4gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMDE6MTk6NDZQTSAtMDcwMCwgRG91Z2xhcyBB
bmRlcnNvbiB3cm90ZToKPiA+ID4gPiBXaGVuIGVudGVyaW5nIGtkYi9rZ2RiIG9uIGEga2VybmVs
IHBhbmljLCBpdCB3YXMgYmUgb2JzZXJ2ZWQgdGhhdCB0aGUKPiA+ID4gPiBjb25zb2xlIGlzbid0
IGZsdXNoZWQgYmVmb3JlIHRoZSBga2RiYCBwcm9tcHQgY2FtZSB1cC4gU3BlY2lmaWNhbGx5LAo+
ID4gPiA+IHdoZW4gdXNpbmcgdGhlIGJ1ZGR5IGxvY2t1cCBkZXRlY3RvciBvbiBhcm02NCBhbmQg
cnVubmluZzoKPiA+ID4gPiAgIGVjaG8gSEFSRExPQ0tVUCA+IC9zeXMva2VybmVsL2RlYnVnL3By
b3Zva2UtY3Jhc2gvRElSRUNUCj4gPiA+ID4KPiA+ID4gPiBJIGNvdWxkIHNlZToKPiA+ID4gPiAg
IFsgICAyNi4xNjEwOTldIGxrZHRtOiBQZXJmb3JtaW5nIGRpcmVjdCBlbnRyeSBIQVJETE9DS1VQ
Cj4gPiA+ID4gICBbICAgMzIuNDk5ODgxXSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0ZWN0ZWQgaGFy
ZCBMT0NLVVAgb24gY3B1IDYKPiA+ID4gPiAgIFsgICAzMi41NTI4NjVdIFNlbmRpbmcgTk1JIGZy
b20gQ1BVIDUgdG8gQ1BVcyA2Ogo+ID4gPiA+ICAgWyAgIDMyLjU1NzM1OV0gTk1JIGJhY2t0cmFj
ZSBmb3IgY3B1IDYKPiA+ID4gPiAgIC4uLiBbYmFja3RyYWNlIGZvciBjcHUgNl0gLi4uCj4gPiA+
ID4gICBbICAgMzIuNTU4MzUzXSBOTUkgYmFja3RyYWNlIGZvciBjcHUgNQo+ID4gPiA+ICAgLi4u
IFtiYWNrdHJhY2UgZm9yIGNwdSA1XSAuLi4KPiA+ID4gPiAgIFsgICAzMi44Njc0NzFdIFNlbmRp
bmcgTk1JIGZyb20gQ1BVIDUgdG8gQ1BVcyAwLTQsNzoKPiA+ID4gPiAgIFsgICAzMi44NzIzMjFd
IE5NSSBiYWNrdHJhY2UgZm9yUCBjcHVBTkM6IEhhcmQgTE9DS1VQCj4gPiA+ID4KPiA+ID4gPiAg
IEVudGVyaW5nIGtkYiAoY3VycmVudD0uLi4sIHBpZCAwKSBvbiBwcm9jZXNzb3IgNSBkdWUgdG8g
S2V5Ym9hcmQgRW50cnkKPiA+ID4gPiAgIFs1XWtkYj4KPiA+ID4gPgo+ID4gPiA+IEFzIHlvdSBj
YW4gc2VlLCBiYWNrdHJhY2VzIGZvciB0aGUgb3RoZXIgQ1BVcyBzdGFydCBwcmludGluZyBhbmQg
Z2V0Cj4gPiA+ID4gaW50ZXJsZWF2ZWQgd2l0aCB0aGUga2RiIFBBTklDIHByaW50Lgo+ID4gPiA+
Cj4gPiA+ID4gTGV0J3MgcmVwbGljYXRlIHRoZSBjb21tYW5kcyB0byBmbHVzaCB0aGUgY29uc29s
ZSBpbiB0aGUga2RiIHBhbmljCj4gPiA+ID4gZW50cnkgcG9pbnQgdG8gYXZvaWQgdGhpcy4KPiA+
ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNo
cm9taXVtLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPgo+ID4gPiA+ICBrZXJuZWwvZGVidWcvZGVi
dWdfY29yZS5jIHwgMyArKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9kZWJ1Z19jb3JlLmMg
Yi9rZXJuZWwvZGVidWcvZGVidWdfY29yZS5jCj4gPiA+ID4gaW5kZXggZDVlOWNjZGUzYWI4Li4z
YTkwNGQ4Njk3YzggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEva2VybmVsL2RlYnVnL2RlYnVnX2NvcmUu
Ywo+ID4gPiA+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9kZWJ1Z19jb3JlLmMKPiA+ID4gPiBAQCAtMTAw
Niw2ICsxMDA2LDkgQEAgdm9pZCBrZ2RiX3BhbmljKGNvbnN0IGNoYXIgKm1zZykKPiA+ID4gPiAg
ICAgICBpZiAocGFuaWNfdGltZW91dCkKPiA+ID4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+
ID4gPgo+ID4gPiA+ICsgICAgIGRlYnVnX2xvY2tzX29mZigpOwo+ID4gPiA+ICsgICAgIGNvbnNv
bGVfZmx1c2hfb25fcGFuaWMoQ09OU09MRV9GTFVTSF9QRU5ESU5HKTsKPiA+ID4gPiArCj4gPiA+
ID4gICAgICAgaWYgKGRiZ19rZGJfbW9kZSkKPiA+ID4gPiAgICAgICAgICAgICAgIGtkYl9wcmlu
dGYoIlBBTklDOiAlc1xuIiwgbXNnKTsKPiA+ID4KPiA+ID4gSSdtIHNvbWV3aGF0IGluY2x1ZGVk
IHRvIHNheSAqdGhpcyogKGNhbGxpbmcga2RiX3ByaW50ZigpIHdoZW4gbm90Cj4gPiA+IGFjdHVh
bGx5IGluIHRoZSBkZWJ1Z2dlcikgaXMgdGhlIGNhdXNlIG9mIHRoZSBwcm9ibGVtLiBrZGJfcHJp
bnRmKCkKPiA+ID4gZG9lcyBzb21lIHByZXR0eSBob3JpZCB0aGluZ3MgdG8gdGhlIGNvbnNvbGUg
YW5kIGlzbid0IGludGVuZGVkIHRvCj4gPiA+IHJ1biB3aGlsZSB0aGUgc3lzdGVtIGlzIGFjdGl2
ZS4KPiA+ID4KPiA+ID4gSSdkIHRoZXJlZm9yZSBiZSBtb3JlIHRlbXB0ZWQgdG8gZGVmZXIgdGhl
IHByaW50IHRvIHRoZSBiLnAuIHRyYXAKPiA+ID4gaGFuZGxlciBpdHNlbGYgYW5kIG1ha2UgdGhp
cyBwYXJ0IG9mIGtnZGJfcGFuaWMoKSBsb29rIG1vcmUgbGlrZToKPiA+ID4KPiA+ID4gICAgICAg
ICBrZ2RiX3BhbmljX21zZyA9IG1zZzsKPiA+ID4gICAgICAgICBrZ2RiX2JyZWFrcG9pbnQoKTsK
PiA+ID4gICAgICAgICBrZ2RiX3BhbmljX21zZyA9IE5VTEw7Cj4gPgo+ID4gVW5mb3J0dW5hdGVs
eSBJIHRoaW5rIHRoYXQgb25seSBzb2x2ZXMgaGFsZiB0aGUgcHJvYmxlbS4gQXMgYSBxdWljawo+
ID4gdGVzdCwgSSB0cmllZCBzaW1wbHkgY29tbWVudGluZyBvdXQgdGhlICJrZGJfcHJpbnRmIiBs
aW5lIGluCj4gPiBrZ2RiX3BhbmljKCkuIFdoaWxlIHRoYXQgYXZvaWRzIHRoZSBpbnRlcmxlYXZl
ZCBwYW5pYyBtZXNzYWdlIGFuZAo+ID4gYmFja3RyYWNlLCBpdCBkb2VzIG5vdGhpbmcgdG8gYWN0
dWFsbHkgZ2V0IHRoZSBiYWNrdHJhY2VzIHByaW50ZWQgb3V0Cj4gPiBiZWZvcmUgeW91IGVuZCB1
cCBpbiBrZGIuIEFzIGFuIGV4YW1wbGUsIHRoaXMgaXMgd2hhdCBoYXBwZW5lZCB3aGVuIEkKPiA+
IHVzZWQgYGVjaG8gSEFSRExPQ0tVUCA+IC9zeXMva2VybmVsL2RlYnVnL3Byb3Zva2UtY3Jhc2gv
RElSRUNUYCBhbmQKPiA+IGhhZCB0aGUgImtkYl9wcmludGYiIGluIGtnZGJfcGFuaWMoKSBjb21t
ZW50ZWQgb3V0Ogo+ID4KPiA+IFsgICA3Mi42NTg0MjRdIGxrZHRtOiBQZXJmb3JtaW5nIGRpcmVj
dCBlbnRyeSBIQVJETE9DS1VQCj4gPiBbICAgODIuMTgxODU3XSB3YXRjaGRvZzogV2F0Y2hkb2cg
ZGV0ZWN0ZWQgaGFyZCBMT0NLVVAgb24gY3B1IDYKPiA+IC4uLgo+ID4gWyAgIDgyLjIzNDgwMV0g
U2VuZGluZyBOTUkgZnJvbSBDUFUgNSB0byBDUFVzIDY6Cj4gPiBbICAgODIuMjM5Mjk2XSBOTUkg
YmFja3RyYWNlIGZvciBjcHUgNgo+ID4gLi4uIFsgc3RhY2sgdHJhY2UgZm9yIENQVSA2IF0gLi4u
Cj4gPiBbICAgODIuMjQwMjk0XSBOTUkgYmFja3RyYWNlIGZvciBjcHUgNQo+ID4gLi4uIFsgc3Rh
Y2sgdHJhY2UgZm9yIENQVSA1IF0gLi4uCj4gPiBbICAgODIuNTc2NDQzXSBTZW5kaW5nIE5NSSBm
cm9tIENQVSA1IHRvIENQVXMgMC00LDc6Cj4gPiBbICAgODIuNTgxMjkxXSBOTUkgYmFja3RyYWNl
Cj4gPiBFbnRlcmluZyBrZGIgKGN1cnJlbnQ9MHhmZmZmZmY4MGRhNWExMDgwLCBwaWQgNjk3OCkg
b24gcHJvY2Vzc29yIDUgZHVlCj4gPiB0byBLZXlib2FyZCBFbnRyeQo+ID4gWzVda2RiPgo+ID4K
PiA+IEFzIHlvdSBjYW4gc2VlLCBJIGRvbid0IHNlZSB0aGUgdHJhY2VzIGZvciBDUFVzIDAtNCBh
bmQgNy4gVGhvc2UgZG8KPiA+IHNob3cgdXAgaWYgSSB1c2UgdGhlICJkbWVzZyIgY29tbWFuZCBi
dXQgaXQncyBhIGJpdCBvZiBhIGhhc3NsZSB0byBydW4KPiA+ICJkbWVzZyIgdG8gbG9vayBmb3Ig
YW55IGV4dHJhIGRlYnVnIG1lc3NhZ2VzIGV2ZXJ5IHRpbWUgSSBkcm9wIGluIGtkYi4KPiA+Cj4g
PiBJIGd1ZXNzIHBlcmhhcHMgdGhhdCBwYXJ0IGlzbid0IG9idmlvdXMgZnJvbSB0aGUgY29tbWl0
IG1lc3NhZ2U/Cj4gCj4gSSBmaWd1cmVkIGl0IHdhcyBhIHJpc2suCj4gCj4gSW4gZmFjdCBpdCdz
IGFuIGFyZWEgd2hlcmUgbXkgaW5zdGluY3QgdG8gaG9ub3VyIGNvbnNvbGUgbWVzc2FnZXMgYW5k
IG15Cj4gaW5zdGluY3QgdG8gZ2V0IGludG8gdGhlIGtlcm5lbCBhcyBzb29uIGFzIHBvc3NpYmxl
IGFmdGVyIHRoZSBkZWNpc2lvbgo+IHRvIGludm9rZSBpdCBoYXMgYmVlbiBtYWRlIGNvbWUgaW50
byBjb25mbGljdC4KPiAKPiBJbiBvdGhlciB3b3JkcyBkb2VzIGl0IG1hdHRlciB0aGF0IHRoZSBj
b25zb2xlIGJ1ZmZlcnMgYXJlIG5vdCBmbHVzaGVkCj4gYmVmb3JlIGVudGVyaW5nIGtnZGI/IEhv
d2V2ZXIgaGF2aW5nIHRob3VnaHQgYWJvdXQgaXQgZm9yIGEgbGl0dGxlIHdoaWxlCj4gKGFuZCBr
bm93aW5nIHRoZSBjb25zb2xlIGNvZGUgdGVuZHMgdG8gYmUgd3JpdHRlbiB0byBiZSBkZWNlbnRs
eSByb2J1c3QpCj4gSSBjYW4gY29tZSB0byB0aGUgdmlldyB0aGUgZmx1c2hpbmcgaXMgYmVzdC4K
Ckp1c3QgZm9yIHJlY29yZC4gSSB3b25kZXJlZCBpZiB0aGVyZSB3YXMgYnVnIGluIHByaW50aygp
IHRoYXQgdGhlCmJhY2t0cmFjZXMgd2VyZSBub3QgZmx1c2hlZC4gQW5kIEkgdGhpbmsgdGhhdCBp
dCBpcyBiZWNhdXNlIHRoZXkKYXJlIHByaW50ZWQgaW4gTk1JIGNvbnRleHQgd2hlcmUgdGhlIGNv
bm9zbGUgaGFuZGxpbmcgaXMgZGVmZXJyZWQuCgpGcm9tIHRoaXMgUE9WLCB0aGUgZXhwbGljaXQg
Zmx1c2ggbWFrZXMgcGVyZmVjdCBzZW5zZS4KCkJlc3QgUmVnYXJkcywKUGV0cgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1h
aWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
