Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31680EFAE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Dec 2023 16:08:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rD4NP-0002HW-7r
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 12 Dec 2023 15:08:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michael@amarulasolutions.com>) id 1rCyXX-000594-H9
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Dec 2023 08:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A//H89nLIqMq0iuRQhq0YsqOdT5hbunDdga9/SvX8lk=; b=dPV7qwIm/6yEEohS9YHzxcteGS
 rp9QwpnY4ooW8LTfjNmxWiI425i+rbrEMprZUOCl+nTKHzAY0mLwWSD0Kwte04ikM8X2N5mD+rtwj
 Unl9OJNQ5IoygsvIBB0vjxXtj3VQo8T+LrS0xqxTvh8iZZTjncQhzyDx/If+pLTs+jYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A//H89nLIqMq0iuRQhq0YsqOdT5hbunDdga9/SvX8lk=; b=b3vGtH2cz0fKIz6petNMlG3A2g
 xPkOUVUHECsE63dLNCU5B1XxkMeuePUeIxAlDampegKO4qHyEUBs0spPPACXms3nUbOvPgEQMZL/e
 y5otDBlBRW1qTi/noeXYGkmEXfumIYcwG/XUeoTXLvtgg5kVeFn1Xh+IrVYr/EpoNPCw=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rCyXQ-0001EH-RN for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Dec 2023 08:54:56 +0000
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a22deb95d21so90962966b.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 Dec 2023 00:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702371276; x=1702976076;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A//H89nLIqMq0iuRQhq0YsqOdT5hbunDdga9/SvX8lk=;
 b=V8mTTABGIGRe3nope8wKDWcPlYZTfeoxDXf4ddgkU/MQd4lqY/PpcOq0xx5fEDqT9W
 1D5qsomm/hXo2/F3pM8g5Au/uDZnsKrUW3PwT0YJZfxj0JsCp3x2UKKeIpx/SRc7BFe6
 uRP48srcxZxM7Ir5+xmPdr01eteHnJIeu0LWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702371276; x=1702976076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A//H89nLIqMq0iuRQhq0YsqOdT5hbunDdga9/SvX8lk=;
 b=qgiLcOeFe+cR3E37SolBdprALSOxzb0sn2O9QIu0baPireqDXCgQab23XWP5R9gRUx
 PZ9W6uoZx+BJEyI+L94Vbzmx5LSauLAuHBogW+hAwb3c5CTb4EHgQTgNgw/ICI7h7/KH
 aQ0e3/mzkZjR5G72Sf/3TuytkUYYcKm9+vp0d6vATHeC/kza55ypLMcVLxLgzKWh+yh9
 E7Ltk9HWfhAx+XBmxY6+luN3zETi8TzND+M2EhRnXAFsTwYLJ3q6mg8AA+ibj9ghlbVt
 hYniqub2DGZB9OGUU+p3o01JRVZMzz6Zwba6pcfXx23beGLSHRtVwtUgOuuwf4PEGJao
 d/1g==
X-Gm-Message-State: AOJu0YzXgA7SUAhboeM6jAqYsHIJfXhcNi7ITRhL3N9FjlQyKTod2OS2
 IpRzmS1vnUddZmrQ52elSkTvlBOx5cERmp8ZUnzgEQ==
X-Google-Smtp-Source: AGHT+IFSJFHOOrQE3V04Fmu3oWSVJD1UkVU09R2ZY1uW85Gte5y23c9QiKs51LSszOA/s908I2zrbL+Lc7tT6S/fyMg=
X-Received: by 2002:a17:907:7d8c:b0:a1d:932f:9096 with SMTP id
 oz12-20020a1709077d8c00b00a1d932f9096mr3903932ejc.37.1702371276353; Tue, 12
 Dec 2023 00:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20231208212845.1679621-1-michael@amarulasolutions.com>
 <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
 <CAOf5uwmT3uFQhyTOkNDMana5na5jcKm81tdyeann2UnFwaQp5w@mail.gmail.com>
 <CAD=FV=WrBg9PuDW__pZbo5YNuWct17gcK4FF-xKeyxEOsw6Qag@mail.gmail.com>
In-Reply-To: <CAD=FV=WrBg9PuDW__pZbo5YNuWct17gcK4FF-xKeyxEOsw6Qag@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 12 Dec 2023 09:54:24 +0100
Message-ID: <CAOf5uw=6=zNmtVU7cOWv6xTaCghvX9j8pA9ijJxEqYpzikGdcg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Doug On Mon, Dec 11, 2023 at 11:00 PM Doug Anderson <dianders@chromium.org>
    wrote: > > Hi, > > On Mon, Dec 11, 2023 at 1:42 PM Michael Nazzareno Trimarchi
    > <michael@amarulasolutions.com> wrote: > > > [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCyXQ-0001EH-RN
X-Mailman-Approved-At: Tue, 12 Dec 2023 15:08:50 +0000
Subject: Re: [Kgdb-bugreport] [RFC PATCH] tty: serial: kgdboc: Fix 8250_*
 kgd over serial
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGkgRG91ZwoKT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMTE6MDDigK9QTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIERlYyAx
MSwgMjAyMyBhdCAxOjQy4oCvUE0gTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCj4gPG1pY2hh
ZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+ID4KPiA+ID4gMS4gaW5pdF9rZ2Rib2Mo
KSBydW5zIGFuZCByZWdpc3RlcnMgdGhlIHNpbmdsZXRvbiBrZ2RiICJwbGF0Zm9ybSBkcml2ZXIi
Lgo+ID4gPgo+ID4gPiAyLiBUaGUgcGxhdGZvcm0gZHJpdmVyJ3MgcHJvYmUgZnVuY3Rpb24sIGtn
ZGJvY19wcm9iZSgpLCBydW5zIGFuZAo+ID4gPiBjaGVja3MgdG8gc2VlIGlmIHRoZSBjb25zb2xl
IGlzIHJlYWR5IGJ5IGxvb2tpbmcgYXQgdGhlIHJldHVybiB2YWx1ZQo+ID4gPiBvZiBjb25maWd1
cmVfa2dkYm9jKCkuIElmIGl0J3MgcmVhZHkgdGhlbiB3ZSdyZSBnb29kIHRvIGdvLiBJZiBpdCdz
Cj4gPiA+IG5vdCByZWFkeSB0aGVuIHdlIGRlZmVyLgo+ID4gPgo+ID4gPiBTbyBJIHRoaW5rIHRo
ZSBidWcgaGVyZSBpcyB0aGF0IHNvbWVob3cgdGhlIGNvbnNvbGUgbG9va3MgInJlYWR5Igo+ID4g
PiAoYmVjYXVzZSB0dHlfZmluZF9wb2xsaW5nX2RyaXZlcigpIGNhbiBmaW5kIGl0KSBidXQgaXQg
aXNuJ3QgYWN0dWFsbHkKPiA+ID4gcmVhZHkgeWV0IChiZWNhdXNlIGl0IGNyYXNoZXMpLiBUaGF0
J3Mgd2hhdCB5b3UgbmVlZCB0byBmaXguCj4gPiA+Cj4gPgo+ID4gVGhlIHBvbGxpbmcgZHJpdmVy
IGxvb2sgZm9yIHVhcnQgYW5kIHVhcnQ4MjUwX2NvcmUgaXMgcmVnaXN0ZXJlZCBhbmQgNCBmYWtl
IHVhcnQKPiA+IGFyZSB0aGVyZSBidXQgdGhlcmUgYXJlIG5vdCBzdGlsbCByZXBsYWNlZCBieSBw
bGF0Zm9ybSBkcml2ZXIgdGhhdCBjYW4KPiA+IGNvbWUgbGF0ZXIuCj4gPiBUaGUgdHJ5X3BvbGxp
bmcgZmluZCBpdCBidXQgaXQncyB0aGUgaXNhLTgyNTAgZHJpdmVyLiBJdCBtZWFucyB0aGF0Cj4g
PiBhZGRfdWFydCA4MjUwIGlzCj4gPiBub3Qgc3RpbGwgaGFwcGVuCj4KPiBUaGUgODI1MCBkcml2
ZXIgaXMgYWx3YXlzIGEgbWF6ZSwgc28geW91IG1pZ2h0IG5lZWQgdG8gZG8gYSBidW5jaCBvZgo+
IGRpZ2dpbmcuIC4uLmJ1dCBpdCBzdXJlIHNvdW5kcyBsaWtlIHRoZSBjb25zb2xlIHNob3VsZG4n
dCBiZQo+IHJlZ2lzdGVyZWQgdW50aWwgdGhlIGNvcnJlY3Qgb3BzIGFyZSBpbiBwbGFjZS4gVGhh
dCBlaXRoZXIgbWVhbnMKPiBnZXR0aW5nIHRoZSBvcHMgcHV0IGluIHBsYWNlIGVhcmxpZXIgb3Ig
ZGVmZXJyaW5nIHdoZW4gdGhlIGNvbnNvbGUgaXMKPiByZWdpc3RlcmVkLi4uCj4KCllvdXIgcG9p
bnQgaXMgcHJldHR5IGNsZWFyIGFuZCBteSBpbml0aWFsIGlkZWEgd2FzIHRvIGZpbmQgYSByZWFs
IGZpeC4KVGhpcyBjb21lIHRvIGF2b2lkCmJyZWFraW5nIGV4aXN0aW5nIHNldHVwIGJ1dCBhbnl3
YXkgSSB3aWxsIGRpZyBpbiBpdCBtb3JlCgpNaWNoYWVsCgo+IC1Eb3VnCgoKCi0tIApNaWNoYWVs
IE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2Vy
Ck0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0aW9ucyBCVgpKb29wIEdl
ZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICszMSAoMCk4NSAxMTEgOTE3
MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVw
b3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
