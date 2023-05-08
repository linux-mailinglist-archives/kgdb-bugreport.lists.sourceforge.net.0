Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C66FB494
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 May 2023 18:03:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pw3Ku-0006vP-TD
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 08 May 2023 16:03:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pw3Kt-0006vI-FC
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 16:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f5S/FC+4loxuZb2hQfcppwnscYEX/EcpE8zM8Zwa0M8=; b=NeEjOzuH+H+Fu6fTkJHBu0xMvy
 sWJ114zaSXNKh5pR7WFTBPVYk8NElmVqhiVloIxr1Nnhm4Gaaf9FyXRhw0hLuCYHhiqcO0PYIT0uD
 d6Aoo4ZtUjFz0uMB0akwrjkUTIYNyEx3o2lVZGO2xcWR+IJeB26iiZYfBsof9HysJ4R8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f5S/FC+4loxuZb2hQfcppwnscYEX/EcpE8zM8Zwa0M8=; b=dBFHMfCOvYrDV1XN6v2MgW9UaP
 V3OXFJrgSCs7RN3YfT8apVTTiBesRx6F22UWa2gBY6pZD2x8+5OWIR/VRqWzDxhSUSf6Af6ky451q
 /TMigxFXpii5Fr6HsEb0fClbqbIVh2R4dFcsupxrC7RvaLR6OBk2+yp/+PGa23IS2Dpw=;
Received: from mail-io1-f43.google.com ([209.85.166.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pw3Kr-002DaK-HS for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 16:03:39 +0000
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-763c3429aa6so379967839f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 May 2023 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683561808; x=1686153808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5S/FC+4loxuZb2hQfcppwnscYEX/EcpE8zM8Zwa0M8=;
 b=kFHZm7fA73PGHC79ZV4Wnkbq6zvQANF2d6TnaZHR+AIL/O6E0YuQQ8x7zVYJAZlZNK
 cBw25H1hSqkKSBrwB+YD2BWiwEUmgJLF756cY1uRiweL0VzKyEIEGevtuHwyXeaYZYc7
 2+i7noZn8LZWwQCpYbNI6yD5LuNM5lX9DFRVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683561808; x=1686153808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5S/FC+4loxuZb2hQfcppwnscYEX/EcpE8zM8Zwa0M8=;
 b=LaPwx3tzP6Z8AwvIGj4DEtNFpWSuIrJTDihbYcqXD3YR/jXYXXyh1+kDeY+M8x0OKA
 u31xn3jmd7Wic++9NE1LQDNIGqOIPUv9SvjfyX0FL4VOhleKgtgWYDNFPUANJTI//pnu
 cg7PmGTunWI3oWuFOklNMaE8fbWDapHQMlSSi0g10EHiLN/mccb/o0527UZ/wPJcHzxa
 I5PvAtNeCcql6y0eJnoSDdxG8wCG/OV66wgwf8CFcr90faHVlkrhgIqnmqmZqKdcmjL+
 Tz8EjZ/i8NyGokyDpFnBRp//AleQqrBi6KOFmoHsa1oCUmcrtwPJ3xbKF0q0x6L8HSPa
 mfjg==
X-Gm-Message-State: AC+VfDzsCVsNESoRGm9zvSUCtwd/TUgCdxI376sxFzRficnwyzVJklEt
 Eu6XodEXeRYn+YhtV6ITpSBBxvs8OEavlm7Ah/g=
X-Google-Smtp-Source: ACHHUZ7S7nizd2Z84KXGV2ME5OERCcqbFkOfnl/kjy+z6KvYEA+Gr+Yw28EwyK776ovSTlBmpe3uAg==
X-Received: by 2002:a92:d991:0:b0:335:25e7:1897 with SMTP id
 r17-20020a92d991000000b0033525e71897mr3775883iln.32.1683561808127; 
 Mon, 08 May 2023 09:03:28 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056638112600b00411b5ea8576sm2119666jar.108.2023.05.08.09.03.27
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 09:03:27 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-32f4e0f42a7so1161545ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 May 2023 09:03:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:3bf:e4e0:26a0 with SMTP id
 t19-20020a05622a181300b003bfe4e026a0mr581724qtc.14.1683561427207; Mon, 08 May
 2023 08:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
 <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
 <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
 <CSGIDMMFXIVH.3SFPYD19Y5WQX@wheely>
In-Reply-To: <CSGIDMMFXIVH.3SFPYD19Y5WQX@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 May 2023 08:56:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7XQog=OSESB8-BLaeSDRg+0cGnK-YoccdLYeFh7_bmA@mail.gmail.com>
Message-ID: <CAD=FV=V7XQog=OSESB8-BLaeSDRg+0cGnK-YoccdLYeFh7_bmA@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sun, May 7, 2023 at 6:35 PM Nicholas Piggin <npiggin@gmail.com>
    wrote: > > On Sat May 6, 2023 at 2:37 AM AEST, Doug Anderson wrote: > > Hi,
    > > > > On Thu, May 4, 2023 at 7:51 PM Nicholas Piggi [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pw3Kr-002DaK-HS
Subject: Re: [Kgdb-bugreport] [PATCH v4 05/17] watchdog/hardlockup: Rename
 touch_nmi_watchdog() to touch_hardlockup_watchdog()
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIE1heSA3LCAyMDIzIGF0IDY6MzXigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCBNYXkgNiwgMjAyMyBhdCAyOjM3IEFN
IEFFU1QsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBUaHUsIE1heSA0
LCAyMDIzIGF0IDc6NTHigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpIE1heSA1LCAyMDIzIGF0IDg6MTMgQU0gQUVTVCwgRG91
Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgdGhlIGJ1ZGR5
IGhhcmRsb2NrdXAgZGV0ZWN0b3IsIHJlbmFtZQo+ID4gPiA+IHRvdWNoX25taV93YXRjaGRvZygp
IHRvIHRvdWNoX2hhcmRsb2NrdXBfd2F0Y2hkb2coKSB0byBtYWtlIGl0IGNsZWFyCj4gPiA+ID4g
dGhhdCBpdCB3aWxsIHRvdWNoIHdoYXRldmVyIGhhcmRsb2NrdXAgZGV0ZWN0b3IgaXMgY29uZmln
dXJlZC4gV2UnbGwKPiA+ID4gPiBhZGQgYSAjZGVmaW5lIGZvciB0aGUgb2xkIG5hbWUgKHRvdWNo
X25taV93YXRjaGRvZykgc28gdGhhdCB3ZSBkb24ndAo+ID4gPiA+IGhhdmUgdG8gdG91Y2ggZXZl
cnkgcGllY2Ugb2YgY29kZSByZWZlcnJpbmcgdG8gdGhlIG9sZCBuYW1lLgo+ID4gPgo+ID4gPiBJ
cyB0aGlzIHJlYWxseSBoZWxwZnVsPyBOb3cgaXQncyBnb3QgdHdvIG5hbWVzIENvdWxkIGp1c3Qg
bGVhdmUgaXQuCj4gPiA+IElmIHlvdSBpbnNpc3QgdGhlbiBpdCdkIGJlIGJldHRlciBqdXN0IHRv
IHJlbmFtZSBldmVyeXRoaW5nIGluIG9uZQo+ID4gPiBnbyBhdCB0aGUgZW5kIG9mIGEgbWVyZ2Ug
d2luZG93IElNTy4gQ29uZmxpY3RzIHdvdWxkIGJlIHRyaXZpYWwuCj4gPgo+ID4gSSdtIG5vdCBw
aWNreSBoZXJlLiBJIGNoYW5nZWQgdGhlIG5hbWUgc2luY2UgUGV0ciByZXF1ZXN0ZWQgbmFtZXMg
dG8KPiA+IGJlIGNoYW5nZWQgZm9yIGFueSBjb2RlIEkgd2FzIHRvdWNoaW5nIFsxXSBhbmQgc28g
SSB0aHJldyB0aGlzIG91dCBhcwo+ID4gYSBwcm9wb3NhbC4gSSBhZ3JlZSB0aGF0IGhhdmluZyB0
d28gbmFtZXMgY2FuIGJlIGNvbmZ1c2luZywgYnV0IGluCj4gPiB0aGlzIGNhc2UgaXQgZGlkbid0
IGZlZWwgdG9vIHRlcnJpYmxlIHRvIG1lLgo+ID4KPiA+IEknZCBsb3ZlIHRvIGhlYXIgUGV0cidz
IG9waW5pb24gb24gdGhpcyBuYW1lIGNoYW5nZS4gSSdtIGhhcHB5IHdpdGg6Cj4gPgo+ID4gYSkg
VGhpcyBwYXRjaCBhcyBpdCBpcy4KPiA+Cj4gPiBiKSBEcm9wcGluZyB0aGlzIHBhdGNoIChvciBw
ZXJoYXBzIGp1c3QgY2hhbmdpbmcgaXQgdG8gYWRkIGNvbW1lbnRzKS4KPiA+Cj4gPiBjKSBDaGFu
Z2luZyB0aGlzIHBhdGNoIHRvIHJlbmFtZSBhbGwgNzAgdXNlcyBvZiB0aGUgb2xkIG5hbWUuIEFz
c3VtaW5nCj4gPiB0aGlzIHdpbGwgZ28gdGhyb3VnaCBBbmRyZXcgTW9ydG9uJ3MgdHJlZSwgSSdk
IGJlIGludGVyZXN0ZWQgaW4KPiA+IHdoZXRoZXIgaGUncyBPSyB3LyB0aGlzLgo+ID4KPiA+IGQp
IERyb3BwaW5nIHRoaXMgcGF0Y2ggZnJvbSB0aGlzIHNlcmllcyBidXQgcHV0dGluZyBpdCBvbiB0
aGUKPiA+IGJhY2tidXJuZXIgdG8gdHJ5IHRvIGRvIGxhdGVyIChzbyB0aGF0IHRoZSByZW5hbWUg
Y2FuIGhhcHBlbiBhdCBhIHRpbWUKPiA+IHdoZW4gaXQncyBsZWFzdCBkaXNydXB0aXZlKS4KPiA+
Cj4gPgo+ID4gPiA+IElkZWFsbHkgdGhpcyBjaGFuZ2Ugd291bGQgYWxzbyByZW5hbWUgdGhlIGFy
Y2hfdG91Y2hfbm1pX3dhdGNoZG9nKCksCj4gPiA+ID4gYnV0IHRoYXQgaXMgaGFyZGVyIHNpbmNl
IGFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCkgaXMgZXhwb3J0ZWQgd2l0aAo+ID4gPiA+IEVYUE9S
VF9TWU1CT0woKSBhbmQgdGh1cyBpcyBBQkkuIEFkZCBhIGNvbW1lbnQgbmV4dCB0byB0aGUgY2Fs
bCB0bwo+ID4gPiA+IGhvcGVmdWxseSBhbGxldmlhdGUgc29tZSBvZiB0aGUgY29uZnVzaW9uIGhl
cmUuCj4gPiA+Cj4gPiA+IFdlIGRvbid0IGtlZXAgQUJJIGZpeGVkIHVwc3RyZWFtLgo+ID4KPiA+
IEknbSBoYXBweSB0byBiZSBjb3JyZWN0ZWQsIGJ1dCBteSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0
IGtlcm5lbCBkZXZzCj4gPiBtYWRlIGFuIGVmZm9ydCBub3QgdG8gbWVzcyB3aXRoIHRoaW5ncyBl
eHBvcnRlZCB2aWEgIkVYUE9SVF9TWU1CT0wiLAo+ID4gYnV0IHRoaW5ncyBleHBvcnRlZCB2aWEg
IkVYUE9SVF9TWU1CT0xfR1BMIiB3ZXJlIGZhaXIgZ2FtZS4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhh
dCdzIHRoZSBjYXNlLiBJZiBhbnl0aGluZyBwZW9wbGUgbWlnaHQgYmUgYSBiaXQgbW9yZQo+IGlu
Y2xpbmVkIHRvIGFjY29tbW9kYXRlIEdQTCBleHBvcnRzIGZvciBvdXQgb2YgdHJlZSBtb2R1bGVz
IHRoYXQgdXNlCj4gdGhlbS4KPgo+ID4gSSBndWVzcyBtYXliZSBteSBwYXRjaCBjYWxsaW5nIGl0
ICJBQkkiIGlzIGEgc3Ryb25nZXIgc3RhdGVtZW50IHRoYW4KPiA+IHRoYXQsIHRob3VnaC4gRG9p
bmcgYSBsaXR0bGUgbW9yZSByZXNlYXJjaCwgbm9ib2R5IHdhbnRzIHRvIHNheSB0aGF0Cj4gPiB0
aGluZ3MgZXhwb3J0ZWQgd2l0aCAiRVhQT1JUX1NZTUJPTCIgYXJlIEFCSSwgdGhleSBqdXN0IHdh
bnQgdG8gc2F5Cj4gPiB0aGF0IHdlIG1ha2UgYW4gZWZmb3J0IHRvIGhhdmUgdGhlbSBiZSBtb3Jl
IHN0YWJsZS4KPgo+IFdlIHdvdWxkbid0IGJyZWFrIGFueSBzeW1ib2wgZm9yIG5vIHJlYXNvbiwg
YnV0IGluIHRoaXMgY2FzZSB0aGVyZSBpcyBhCj4gZ29vZCByZWFzb24uIElmIHRoZSBuYW1lIGNo
YW5nZSBpcyBpbXBvcnRhbnQgZm9yIGNsYXJpdHkgdGhlbiB3ZSBjaGFuZ2UKPiBpdC4gQW5kIHRo
aXMgaXMgYWJvdXQgdGhlIGVhc2llc3QgY2hhbmdlIGZvciBhbiBvdXQgb2YgdHJlZSBtb2R1bGUg
dG8KPiBkZWFsIHdpdGgsIHNvIGl0IHNob3VsZCBiZSBubyBiaWcgZGVhbCBmb3IgdGhlbS4KCk9L
LCBmYWlyIGVub3VnaC4gTXkgY3VycmVudCBwbGFuIGlzIHRvIHdhaXQgYSBmZXcgbW9yZSBkYXlz
IHRvIHNlZSBpZgphbnlvbmUgZWxzZSBjaGltZXMgaW4gd2l0aCBvcGluaW9ucy4gSWYgSSBkb24n
dCBoZWFyIGFueXRoaW5nLCBpbiBteQpuZXh0IHZlcnNpb24gSSB3aWxsIHJlbmFtZSBfbmVpdGhl
cl8gdG91Y2hfbm1pX3dhdGNoZG9nKCkgbm9yCmFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCkuIEkn
bGwgc3RpbGwgYWRkIGNvbW1lbnRzIGluZGljYXRpbmcgdGhhdAp0aGVzZSBmdW5jdGlvbnMgdG91
Y2ggdGhlICJoYXJkbG9ja3VwIiB3YXRjaGRvZyBidXQgSSB3b24ndCBhdHRlbXB0CnRoZSByZW5h
bWUganVzdCB0byBrZWVwIHRoZSBzZXJpZXMgc2ltcGxlci4KCi1Eb3VnCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
