Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB881598B
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 16 Dec 2023 14:46:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rEUzu-00030i-3O
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 16 Dec 2023 13:46:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michael@amarulasolutions.com>) id 1rEUzt-00030c-3d
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 16 Dec 2023 13:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G8xT25O20RU+TsLhM6aVYkQaH5ZlroXWhbUjiAE2DMs=; b=hbrf9z5zTV7oEH0l2gjaSbfZkM
 A3LQ8M0YGXbY/jYkSCIBUHHCylMSip7tjeFYs+kVcpExeZLjh4x34495ZYQkyVmSvRCFKdwSSMSSA
 tSmCjs9Xu78dInmCxyF6ZDvudSEByFscLgBLAwdmR5Ik9KjffImW9Hh4XaTsDucp7ElE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G8xT25O20RU+TsLhM6aVYkQaH5ZlroXWhbUjiAE2DMs=; b=XNq7VIV4n8+e17JWNjJUXepGlD
 TcRTiVbPLtC1mBy7TTuSePOedzCG7TKjqZJsSb9+324Fu62xUPzkE6uE/pLWv8brvEvObI+tVjUsu
 bBx2FNPq+CNnT3VdorAqO68LrXXiEHkWsUjwJQm1b3zu+MT2QUIaZib12aPeRX0vU3yE=;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEUzi-0001VW-M9 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 16 Dec 2023 13:46:29 +0000
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-54cb4fa667bso1894044a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 16 Dec 2023 05:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702734367; x=1703339167;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8xT25O20RU+TsLhM6aVYkQaH5ZlroXWhbUjiAE2DMs=;
 b=ZPXoEwrXUZ9iRMZ/l5dCXjq2Rxa5VNt3aIEv4HusfOJIrhpXOxxszU5BDG6DD5ZMm9
 JyCudU2PUoxYUnBB1i+8SPlKS2ueZnR/uduDSB5uUzc1tcu9gJougz2+pTwCzPCTh4QZ
 SpGIKTgdzkAbjQ/WYcitOJOBHnG4FG7mHDDis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702734367; x=1703339167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G8xT25O20RU+TsLhM6aVYkQaH5ZlroXWhbUjiAE2DMs=;
 b=FfuL6uYJ/IWT0zVc4xHdImqTRvfO+OeXOa6KzdSYlzMpyNxTNmLfjzdlhvRtOcl+XG
 MKlxo8TFDAfPLb/qSDEhCy1AONOIM9LeLqHjLb1qf6eY91b/tIPYMILWkWX+00Qeod9N
 f5MEgHPHW6zuVqzpPsVjB+fToc9a5spN31MsPgp1OhPFyubsRCH/BudrSNzYpVg3DEKT
 C5D9n2h/GtDCvfa40B4h6yHPf3yC0E8VXCFFwngfzJkttqsNvc3nMYDkD3+wwPGTJh76
 xGxqKsb4s0mGt/dZ6hrRnt7C/F7QHoIWVsKQb+4Vt2d5gk9xJof6sGAZNKM/cTmUPSBV
 8l1A==
X-Gm-Message-State: AOJu0YwAL08jy3G7hHrpNi1SR+gaFwD0vVRKTcRpHI2DW6CWsrffM0vt
 0XEuVq5WelWIgT58YR6fV481s9LAMtV+u1uv9R16Ag==
X-Google-Smtp-Source: AGHT+IEGVShzeDISEpnOUlXp42zimt0iY+0zTMh1tw4G8p95d4s+OpBxkDGkAsrjOVGesf/2pqiTkO/QZvE6MGAMtPg=
X-Received: by 2002:a17:906:142:b0:a22:faf0:3bbc with SMTP id
 2-20020a170906014200b00a22faf03bbcmr3599797ejh.139.1702734367105; Sat, 16 Dec
 2023 05:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20231208212845.1679621-1-michael@amarulasolutions.com>
 <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
 <CAOf5uwmT3uFQhyTOkNDMana5na5jcKm81tdyeann2UnFwaQp5w@mail.gmail.com>
 <CAD=FV=WrBg9PuDW__pZbo5YNuWct17gcK4FF-xKeyxEOsw6Qag@mail.gmail.com>
 <CAOf5uw=6=zNmtVU7cOWv6xTaCghvX9j8pA9ijJxEqYpzikGdcg@mail.gmail.com>
In-Reply-To: <CAOf5uw=6=zNmtVU7cOWv6xTaCghvX9j8pA9ijJxEqYpzikGdcg@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 16 Dec 2023 14:45:55 +0100
Message-ID: <CAOf5uwmTg_T+vHsZwMtkPbxqQdQx4VucMni+f71KtGZY_XdgcA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Doug On Tue, Dec 12, 2023 at 9:54 AM Michael Nazzareno
    Trimarchi <michael@amarulasolutions.com> wrote: > > Hi Doug > > On Mon, Dec
    11, 2023 at 11:00 PM Doug Anderson <dianders@chromium.org> wrote: > > [...]
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEUzi-0001VW-M9
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

SGkgRG91ZwoKT24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgOTo1NOKAr0FNIE1pY2hhZWwgTmF6emFy
ZW5vIFRyaW1hcmNoaQo8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBI
aSBEb3VnCj4KPiBPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAxMTowMOKAr1BNIERvdWcgQW5kZXJz
b24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gT24g
TW9uLCBEZWMgMTEsIDIwMjMgYXQgMTo0MuKAr1BNIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNo
aQo+ID4gPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+
IDEuIGluaXRfa2dkYm9jKCkgcnVucyBhbmQgcmVnaXN0ZXJzIHRoZSBzaW5nbGV0b24ga2dkYiAi
cGxhdGZvcm0gZHJpdmVyIi4KPiA+ID4gPgo+ID4gPiA+IDIuIFRoZSBwbGF0Zm9ybSBkcml2ZXIn
cyBwcm9iZSBmdW5jdGlvbiwga2dkYm9jX3Byb2JlKCksIHJ1bnMgYW5kCj4gPiA+ID4gY2hlY2tz
IHRvIHNlZSBpZiB0aGUgY29uc29sZSBpcyByZWFkeSBieSBsb29raW5nIGF0IHRoZSByZXR1cm4g
dmFsdWUKPiA+ID4gPiBvZiBjb25maWd1cmVfa2dkYm9jKCkuIElmIGl0J3MgcmVhZHkgdGhlbiB3
ZSdyZSBnb29kIHRvIGdvLiBJZiBpdCdzCj4gPiA+ID4gbm90IHJlYWR5IHRoZW4gd2UgZGVmZXIu
Cj4gPiA+ID4KPiA+ID4gPiBTbyBJIHRoaW5rIHRoZSBidWcgaGVyZSBpcyB0aGF0IHNvbWVob3cg
dGhlIGNvbnNvbGUgbG9va3MgInJlYWR5Igo+ID4gPiA+IChiZWNhdXNlIHR0eV9maW5kX3BvbGxp
bmdfZHJpdmVyKCkgY2FuIGZpbmQgaXQpIGJ1dCBpdCBpc24ndCBhY3R1YWxseQo+ID4gPiA+IHJl
YWR5IHlldCAoYmVjYXVzZSBpdCBjcmFzaGVzKS4gVGhhdCdzIHdoYXQgeW91IG5lZWQgdG8gZml4
Lgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoZSBwb2xsaW5nIGRyaXZlciBsb29rIGZvciB1YXJ0IGFu
ZCB1YXJ0ODI1MF9jb3JlIGlzIHJlZ2lzdGVyZWQgYW5kIDQgZmFrZSB1YXJ0Cj4gPiA+IGFyZSB0
aGVyZSBidXQgdGhlcmUgYXJlIG5vdCBzdGlsbCByZXBsYWNlZCBieSBwbGF0Zm9ybSBkcml2ZXIg
dGhhdCBjYW4KPiA+ID4gY29tZSBsYXRlci4KPiA+ID4gVGhlIHRyeV9wb2xsaW5nIGZpbmQgaXQg
YnV0IGl0J3MgdGhlIGlzYS04MjUwIGRyaXZlci4gSXQgbWVhbnMgdGhhdAo+ID4gPiBhZGRfdWFy
dCA4MjUwIGlzCj4gPiA+IG5vdCBzdGlsbCBoYXBwZW4KPiA+Cj4gPiBUaGUgODI1MCBkcml2ZXIg
aXMgYWx3YXlzIGEgbWF6ZSwgc28geW91IG1pZ2h0IG5lZWQgdG8gZG8gYSBidW5jaCBvZgo+ID4g
ZGlnZ2luZy4gLi4uYnV0IGl0IHN1cmUgc291bmRzIGxpa2UgdGhlIGNvbnNvbGUgc2hvdWxkbid0
IGJlCj4gPiByZWdpc3RlcmVkIHVudGlsIHRoZSBjb3JyZWN0IG9wcyBhcmUgaW4gcGxhY2UuIFRo
YXQgZWl0aGVyIG1lYW5zCj4gPiBnZXR0aW5nIHRoZSBvcHMgcHV0IGluIHBsYWNlIGVhcmxpZXIg
b3IgZGVmZXJyaW5nIHdoZW4gdGhlIGNvbnNvbGUgaXMKPiA+IHJlZ2lzdGVyZWQuLi4KPiA+Cj4K
PiBZb3VyIHBvaW50IGlzIHByZXR0eSBjbGVhciBhbmQgbXkgaW5pdGlhbCBpZGVhIHdhcyB0byBm
aW5kIGEgcmVhbCBmaXguCj4gVGhpcyBjb21lIHRvIGF2b2lkCj4gYnJlYWtpbmcgZXhpc3Rpbmcg
c2V0dXAgYnV0IGFueXdheSBJIHdpbGwgZGlnIGluIGl0IG1vcmUKPgo+IE1pY2hhZWwKCldoYXQg
YWJvdXQgdGhpcz8KCi0tLSBhL2RyaXZlcnMvdHR5L3R0eV9pby5jCisrKyBiL2RyaXZlcnMvdHR5
L3R0eV9pby5jCkBAIC0zODUsNiArMzg1LDcgQEAgc3RydWN0IHR0eV9kcml2ZXIgKnR0eV9maW5k
X3BvbGxpbmdfZHJpdmVyKGNoYXIKKm5hbWUsIGludCAqbGluZSkKICAgICAgICBpbnQgdHR5X2xp
bmUgPSAwOwogICAgICAgIGludCBsZW47CiAgICAgICAgY2hhciAqc3RyLCAqc3RwOworICAgICAg
IGludCBpbmRleDsKCiAgICAgICAgZm9yIChzdHIgPSBuYW1lOyAqc3RyOyBzdHIrKykKICAgICAg
ICAgICAgICAgIGlmICgoKnN0ciA+PSAnMCcgJiYgKnN0ciA8PSAnOScpIHx8ICpzdHIgPT0gJywn
KQpAQCAtNDA2LDcgKzQwNyw3IEBAIHN0cnVjdCB0dHlfZHJpdmVyICp0dHlfZmluZF9wb2xsaW5n
X2RyaXZlcihjaGFyCipuYW1lLCBpbnQgKmxpbmUpCiAgICAgICAgICAgICAgICBpZiAoKnN0cCA9
PSAnXDAnKQogICAgICAgICAgICAgICAgICAgICAgICBzdHAgPSBOVUxMOwoKLSAgICAgICAgICAg
ICAgIGlmICh0dHlfbGluZSA+PSAwICYmIHR0eV9saW5lIDwgcC0+bnVtICYmIHAtPm9wcyAmJgor
ICAgICAgICAgICAgICAgaWYgKHR0eV9saW5lID49IDAgJiYgdHR5X2xpbmUgPCBwLT5udW0gJiYg
cC0+b3BzICYmCmNvbnNvbGVfZGV2aWNlKCZpbmRleCkgPT0gcCAmJgogICAgICAgICAgICAgICAg
ICAgIHAtPm9wcy0+cG9sbF9pbml0ICYmICFwLT5vcHMtPnBvbGxfaW5pdChwLCB0dHlfbGluZSwg
c3RwKSkgewogICAgICAgICAgICAgICAgICAgICAgICByZXMgPSB0dHlfZHJpdmVyX2tyZWZfZ2V0
KHApOwogICAgICAgICAgICAgICAgICAgICAgICAqbGluZSA9IHR0eV9saW5lOwoKSSB3aWxsIHNl
bmQgcHJvcGVyIHBhdGNoCgpbICAgMTguODg1MzQ4XSBwcmludGs6IGxlZ2FjeSBjb25zb2xlIFt0
dHlTMl0gZGlzYWJsZWQKWyAgIDE4Ljg5MDgyMV0gMjgwMDAwMC5zZXJpYWw6IHR0eVMyIGF0IE1N
SU8gMHgyODAwMDAwIChpcnEgPSAyODMsCmJhc2VfYmF1ZCA9IDMwMDAwMDApIGlzIGEgODI1MApb
ICAgMTguODk5NzI3XSBwcmludGs6IGxlZ2FjeSBjb25zb2xlIFt0dHlTMl0gZW5hYmxlZApbICAg
MTguOTA5NDQwXSBwcmludGs6IGxlZ2FjeSBib290Y29uc29sZSBbbnMxNjU1MGEwXSBkaXNhYmxl
ZApbICAgMTguOTIzMjYzXSBvbWFwODI1MF9wcm9iZTogcmVnaXN0ZXIgdWFydCAyODAwMDAwLnNl
cmlhbAoKTWljaGFlbAo+Cj4gPiAtRG91Zwo+Cj4KPgo+IC0tCj4gTWljaGFlbCBOYXp6YXJlbm8g
VHJpbWFyY2hpCj4gQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2VyCj4gTS4gKzM5
IDM0NyA5MTMgMjE3MAo+IG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4KPiBBbWFydWxhIFNvbHV0aW9ucyBCVgo+IEpvb3Ag
R2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKPiBULiArMzEgKDApODUgMTEx
IDkxNzIKPiBpbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gd3d3LmFtYXJ1bGFzb2x1dGlvbnMu
Y29tCgoKCi0tIApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVm
IEV4ZWN1dGl2ZSBPZmZpY2VyCk0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29s
dXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNv
bHV0aW9ucyBCVgpKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQu
ICszMSAoMCk4NSAxMTEgOTE3MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxh
c29sdXRpb25zLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8va2dkYi1idWdyZXBvcnQK
