Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC5D951F33
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Aug 2024 17:55:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1seGLR-0002cD-Oj
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Aug 2024 15:55:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1seGLR-0002c7-0T
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 15:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=El+aZTkSl3vZusGpichp3+hPwG6mnp7ZbwHnzJwTPTk=; b=nJZn0/XR1Ugq+AzGdQEonOsn+v
 X7sVs0ug0oPFAZnFYGEfPry+iKMugurE77JyRQPQ5bVlw2Gj+AILGMBAG1sXtckqhFd/WYmLrvZVZ
 DvtrvqkxX376/qkECPTYoKYrw5JZjYabway2SmmBurDLXUUGgaK//7gnVNeE/4JwG3XU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=El+aZTkSl3vZusGpichp3+hPwG6mnp7ZbwHnzJwTPTk=; b=gtGlsfEn9sKrUEJ3NjST0xY/9W
 g2MjfoUepMSK6TqLNzI3y5vpUjG4zXSeWUZ4LRx3nSjJXoyhqNfx/gyxu5Eng9LCk/NA67kEp8U0h
 vUNSIynj9r3q3/l3/IlLzO/Zfb0yhj3sYVq7gWAzHHi/pHBFaFINYj5so++twIyKRx1E=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seGLQ-00036M-Tp for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 15:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1DB30CE1A29;
 Wed, 14 Aug 2024 15:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2D5C116B1;
 Wed, 14 Aug 2024 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723650921;
 bh=3M3wiWnQTSAXkMzacuqW6SeqAEhIrDbX3h51wo5nQhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o9lAoXbvmyNMiw2tSeW37J6/tffVKTyGtOY3wT8RYgBeROT+bqrCfg3jVA0+nmUmc
 d/BbzNg8vi2QNam7ZBAJ6I6Knm5c7CwomutfsQF+JR7HYSRrFSKDSA/RXQZjj7DtDu
 8Vszgc02jYhktfsgOeeMFVUFtoo3ValvG7k/CSyQ=
Date: Wed, 14 Aug 2024 17:55:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <2024081410-scrabble-drizzly-3005@gregkh>
References: <20240812085459.291741-1-mail@florommel.de>
 <CAD=FV=VC20PvOPSf9quqghA8SKKkCduadtU7nso4wkSwVKH3jQ@mail.gmail.com>
 <20240814153843.GA168155@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814153843.GA168155@aspen.lan>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Aug 14, 2024 at 04:38:43PM +0100, Daniel Thompson
   wrote: > On Mon, Aug 12, 2024 at 01:04:22PM -0700, Doug Anderson wrote: >
   > Hi, > > > > On Mon, Aug 12, 2024 at 1:55 AM Florian Rommel <mail [...]
    
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linuxfoundation.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [145.40.73.55 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seGLQ-00036M-Tp
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: fix hw_access_break_test
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
Cc: Arnd Bergmann <arnd@arndb.de>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Florian Rommel <mail@florommel.de>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMDQ6Mzg6NDNQTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEyLCAyMDI0IGF0IDAxOjA0OjIyUE0gLTA3MDAsIERvdWcg
QW5kZXJzb24gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBNb24sIEF1ZyAxMiwgMjAyNCBhdCAx
OjU14oCvQU0gRmxvcmlhbiBSb21tZWwgPG1haWxAZmxvcm9tbWVsLmRlPiB3cm90ZToKPiA+ID4K
PiA+ID4gVGhlIHRlc3QgZm9yIGFjY2VzcyB3YXRjaHBvaW50cyAoaHdfYWNjZXNzX2JyZWFrX3Rl
c3QpIHdhcyBicm9rZW4KPiA+ID4gKGFsd2F5cyBmYWlsZWQpIGJlY2F1c2UgdGhlIGNvbXBpbGVy
IG9wdGltaXplZCBvdXQgdGhlIHdyaXRlIHRvIHRoZQo+ID4gPiBzdGF0aWMgaGVscGVyIHZhcmlh
YmxlIChod19icmVha192YWwyKSwgYXMgaXQgaXMgbmV2ZXIgcmVhZCBhbnl3aGVyZS4KPiA+ID4g
VGhpcyByZXN1bHRlZCBpbiB0aGUgdGFyZ2V0IHZhcmlhYmxlIChod19icmVha192YWwpIG5vdCBi
ZWluZyBhY2Nlc3NlZAo+ID4gPiBhbmQgdGh1cyB0aGUgYnJlYWtwb2ludCBub3QgYmVpbmcgdHJp
Z2dlcmVkLgo+ID4gPgo+ID4gPiBSZW1vdmUgdGhlIGhlbHBlciB2YXJpYWJsZSAoaHdfYnJlYWtf
dmFsMiksIGFuZCB1c2UgUkVBRF9PTkNFIHRvIGZvcmNlCj4gPiA+IHJlYWRpbmcgdGhlIHRhcmdl
dCB2YXJpYWJsZSAoaHdfYnJlYWtfdmFsKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmxv
cmlhbiBSb21tZWwgPG1haWxAZmxvcm9tbWVsLmRlPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMv
bWlzYy9rZ2RidHMuYyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IAo+IExvb2tzIGdvb2QuIEkgcHVzaGVkIHRoaXMg
dGhyb3VnaCBrZ2RidGVzdCBhbmQgaXQgbGlrZXMgaXQgdG9vLiBJIGNhbgo+IHR1cm4gb25lIG9m
IHRoZSBYRkFJTHMgb2ZmICh5YXkpLgo+IAo+IEFja2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRh
bmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IFRlc3RlZC1ieTogRGFuaWVsIFRob21wc29uIDxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAKPiBBcm5kL0dyZWc6IEFyZSB5b3UgaGFwcHkg
dG8gcGljayB0aGlzIHVwIG9yIHNob3VsZCBJIHRha2UgaXQgdGhyb3VnaCB0aGUga2dkYgo+IHRy
ZWU/IEZXSVcgcmlnaHQgbm93IHRoZXJlIGFyZSB6ZXJvIG90aGVyIHBhdGNoZXMgZm9yIGtnZGIg
dGhpcyBjeWNsZSwgYWx0aG91Z2gKPiB0aGF0IGNvdWxkIGNoYW5nZSEKCkkndmUgYWxyZWFkeSBw
aWNrZWQgaXQgdXAsIHRoYW5rcyEKCmdyZWcgay1oCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
