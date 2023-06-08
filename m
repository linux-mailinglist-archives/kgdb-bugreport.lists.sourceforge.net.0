Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E537281A9
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 15:47:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q7Fyq-0001YG-OV
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 08 Jun 2023 13:47:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q7FyX-0001Xx-Eb
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 13:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2KBbWiKkW090r6xpGGTvZasEo61erYv6UtVsy3logoc=; b=b+QtV+zw7ZmvvDIrY8BekxRIz0
 KFLwTyQ8GdEM4xrVp9MJ/RmeTy3DWoDnnRDfAW9WniJHwrNHH+Ypj5dZnYJWPwJKJH/ysKhLrnqN6
 x7lRZ+ufa0RiYXuYpWwjj6y57kXAH+jIDRHn1916nBgwcKBSBnYKmadmK819BSvhGghQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2KBbWiKkW090r6xpGGTvZasEo61erYv6UtVsy3logoc=; b=j3ZMcGVidX2I1rAsAHOjYk/gA0
 YrD5io/ktbFeX1AT0/OskvXyTOGAoMazG40e+HuE0xrzFR1MI3eJWlAFXkWW61Hf/BCB/IyTjXUIn
 sYkkubzzuIed7ljaeG4fXb119iQxWcDwFwLdgSCIq4qzzHLtpNpYITe04mIU79fv4czM=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7FyT-00EkfZ-Ah for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 13:46:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 103221FDCA;
 Thu,  8 Jun 2023 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686232003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KBbWiKkW090r6xpGGTvZasEo61erYv6UtVsy3logoc=;
 b=HqK/AlDpvfGbTNDmGl55bMAaRj6QwKTZptYCWk/8avkFYFqLmq4bw6Sw0GLb/IrsNS/G57
 8gK1NfadlvJi1Meb9tkQezNlillNl9LFNkb33uQxqs8z0wBiQjM/DsuMQveTjApYL/MMhg
 MqyEbMnJuAYDNVYk5+VBUPnksHEqbWY=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 46C822C141;
 Thu,  8 Jun 2023 13:46:41 +0000 (UTC)
Date: Thu, 8 Jun 2023 15:46:38 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZIHbvlw05razk-oJ@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-5-pmladek@suse.com>
 <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed 2023-06-07 16:36:35, Doug Anderson wrote: > Hi, > >
    On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote: >
   > > > diff --git a/arch/Kconfig b/arch/Kconfig > > index 13c6e596cf9 [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q7FyT-00EkfZ-Ah
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] watchdog/hardlockup: Enable
 HAVE_NMI_WATCHDOG only on sparc64
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
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkIDIwMjMtMDYtMDcgMTY6MzY6MzUsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA4OjI14oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtA
c3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL0tjb25maWcgYi9hcmNo
L0tjb25maWcKPiA+IGluZGV4IDEzYzZlNTk2Y2Y5ZS4uNTdmMTViYWJlMTg4IDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9LY29uZmlnCj4gPiArKysgYi9hcmNoL0tjb25maWcKPiA+IEBAIC00MDQsMTAg
KzQwNCw5IEBAIGNvbmZpZyBIQVZFX05NSV9XQVRDSERPRwo+ID4gICAgICAgICBkZXBlbmRzIG9u
IEhBVkVfTk1JCj4gPiAgICAgICAgIGJvb2wKPiA+ICAgICAgICAgaGVscAo+ID4gLSAgICAgICAg
IFRoZSBhcmNoIHByb3ZpZGVzIGl0cyBvd24gaGFyZGxvY2t1cCBkZXRlY3RvciBpbXBsZW1lbnRh
dGlvbiBpbnN0ZWFkCj4gPiArICAgICAgICAgU3BhcmM2NCBwcm92aWRlcyBpdHMgb3duIGhhcmRs
b2NrdXAgZGV0ZWN0b3IgaW1wbGVtZW50YXRpb24gaW5zdGVhZAo+ID4gICAgICAgICAgIG9mIHRo
ZSBnZW5lcmljIHBlcmYgb25lLgo+IAo+IEl0J3MgYSBsaXR0bGUgd2VpcmQgdG8gZG9jdW1lbnQg
Z2VuZXJpYyB0aGluZ3Mgd2l0aCB0aGUgc3BlY2lmaWNzIG9mCj4gdGhlIHVzZXIuIFRoZSBleGNl
cHRpb24sIElNTywgaXMgd2hlbiBzb21ldGhpbmcgaXMgZGVwcmVjYXRlZC4KPiBQZXJzb25hbGx5
LCBpdCB3b3VsZCBzb3VuZCBsZXNzIHdlaXJkIHRvIG1lIHRvIHNheSBzb21ldGhpbmcgbGlrZToK
Ck9yIEkgY291bGQgcmVwbGFjZSAiVGhlIGFyY2giIGJ5ICJTcGFyYzY0IiBpbiB0aGUgNXRoIHBh
dGNoIHdoaWNoCnJlbmFtZXMgdGhlIHZhcmlhYmxlIHRvIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9TUEFSQzY0LiBJdCB3aWxsCm5vdCBsb25nZXIgYmUgYSBnZW5lcmljIHRoaW5nLi4uCgpPciBJ
IGNvdWxkIHNxdWFzaCB0aGUgdHdvIHBhdGNoZXMuIEkgZGlkIG5vdCB3YW50IHRvIGRvIHRvbyBt
YW55CmNoYW5nZXMgYXQgdGhlIHNhbWUgdGltZS4gQnV0IGl0IG1pZ2h0IGFjdHVhbGx5IG1ha2Ug
c2Vuc2UgdG8KZG8gdGhpcyBpbiBvbmUgc3RlcC4KCj4gCj4gPiBkaWZmIC0tZ2l0IGEvbGliL0tj
b25maWcuZGVidWcgYi9saWIvS2NvbmZpZy5kZWJ1Zwo+ID4gaW5kZXggZDIwMWY1ZDM4NzZiLi40
YjRhYTBmOTQxZjkgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvS2NvbmZpZy5kZWJ1Zwo+ID4gKysrIGIv
bGliL0tjb25maWcuZGVidWcKPiA+IEBAIC0xMDUwLDE1ICsxMDUwLDEzIEBAIGNvbmZpZyBIQVZF
X0hBUkRMT0NLVVBfREVURUNUT1JfQlVERFkKPiA+ICAjICAgICAgc3BhcmM2NDogaGFzIGEgY3Vz
dG9tIGltcGxlbWVudGF0aW9uIHdoaWNoIGlzIG5vdCB1c2luZyB0aGUgY29tbW9uCj4gPiAgIyAg
ICAgICAgICAgICAgaGFyZGxvY2t1cCBjb21tYW5kIGxpbmUgb3B0aW9ucyBhbmQgc3lzY3RsIGlu
dGVyZmFjZS4KPiA+ICAjCj4gPiAtIyBOb3RlIHRoYXQgSEFWRV9OTUlfV0FUQ0hET0cgaXMgdXNl
ZCB0byBkaXN0aW5ndWlzaCB0aGUgc3BhcmM2NCBzcGVjaWZpYwo+ID4gLSMgaW1wbGVtZW50YWlv
bi4gSXQgaXMgYXV0b21hdGljYWxseSBlbmFibGVkIGFsc28gZm9yIG90aGVyIGFyY2gtc3BlY2lm
aWMKPiA+IC0jIHZhcmlhbnRzIHdoaWNoIHNldCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJD
SC4gSXQgbWFrZXMgdGhlIGNoZWNrCj4gPiAtIyBvZiBhdmFpYWxhYmxlIGFuZCBzdXBwb3J0ZWQg
dmFyaWFudHMgcXVpdGUgdHJpY2t5Lgo+ID4gKyMgTm90ZSB0aGF0IEhBVkVfTk1JX1dBVENIRE9H
IGlzIHNldCB3aGVuIHRoZSBzcGFyYzY0IHNwZWNpZmljIGltcGxlbWVudGF0aW9uCj4gPiArIyBp
cyB1c2VkLgo+ID4gICMKPiA+ICBjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RPUgo+ID4gICAgICAg
ICBib29sICJEZXRlY3QgSGFyZCBMb2NrdXBzIgo+ID4gLSAgICAgICBkZXBlbmRzIG9uIERFQlVH
X0tFUk5FTCAmJiAhUzM5MAo+ID4gLSAgICAgICBkZXBlbmRzIG9uICgoSEFWRV9IQVJETE9DS1VQ
X0RFVEVDVE9SX1BFUkYgfHwgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZKSAmJiAhSEFW
RV9OTUlfV0FUQ0hET0cpIHx8IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNICj4gPiArICAg
ICAgIGRlcGVuZHMgb24gREVCVUdfS0VSTkVMICYmICFTMzkwICYmICFIQVZFX05NSV9XQVRDSERP
Rwo+ID4gKyAgICAgICBkZXBlbmRzIG9uIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIHx8
IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSB8fCBIQVZFX0hBUkRMT0NLVVBfREVURUNU
T1JfQVJDSAo+IAo+IElmIHlvdSBhZGQgdGhlICIhSEFWRV9OTUlfV0FUQ0hET0ciIGFzIGEgZGVw
ZW5kZW5jeSB0bwo+IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSwgYXMgZGlzY3Vzc2Vk
IGluIGEgcHJldmlvdXMgcGF0Y2gsIHlvdQo+IGNhbiBza2lwIGFkZGluZyBpdCBoZXJlLgoKSXQg
aXQgcmVsYXRlZCB0byB0aGUgMm5kIHBhdGNoLiBMZXQncyBkaXNjdXNzIGl0IHRoZXJlLgoKPiAK
PiA+ICAgICAgICAgaW1wbHkgSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGCj4gPiAgICAgICAgIGlt
cGx5IEhBUkRMT0NLVVBfREVURUNUT1JfQlVERFkKPiA+ICAgICAgICAgc2VsZWN0IExPQ0tVUF9E
RVRFQ1RPUgo+ID4gQEAgLTEwNzksNyArMTA3Nyw3IEBAIGNvbmZpZyBIQVJETE9DS1VQX0RFVEVD
VE9SX1BSRUZFUl9CVUREWQo+ID4gICAgICAgICBib29sICJQcmVmZXIgdGhlIGJ1ZGR5IENQVSBo
YXJkbG9ja3VwIGRldGVjdG9yIgo+ID4gICAgICAgICBkZXBlbmRzIG9uIEhBUkRMT0NLVVBfREVU
RUNUT1IKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfUEVS
RiAmJiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQlVERFkKPiA+IC0gICAgICAgZGVwZW5kcyBv
biAhSEFWRV9OTUlfV0FUQ0hET0cKPiA+ICsgICAgICAgZGVwZW5kcyBvbiAhSEFWRV9IQVJMT0NL
VVBfREVURUNUT1JfQVJDSAo+IAo+IERvbid0IG5lZWQgdGhpcy4gQXJjaGl0ZWN0dXJlcyBuZXZl
ciBhcmUgYWxsb3dlZCB0byBkZWZpbmUKPiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRiBh
bmQgSEFWRV9IQVJMT0NLVVBfREVURUNUT1JfQVJDSAoKU2FtZSBoZXJlLi4uCgpCZXN0IFJlZ2Fy
ZHMsClBldHIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tn
ZGItYnVncmVwb3J0Cg==
