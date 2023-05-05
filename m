Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825D6F86E6
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 18:38:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puySC-0003Ku-4n
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 May 2023 16:38:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puySA-0003Kk-UL
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hx/Z1QGIGo513DGFRHbMqQT6fmsKMlQd8/3rs/cumNc=; b=VoNvMIO2IQcmd+CgqJSFmBUFkk
 llPIlke4NUzKDVgS+mje011i39RqyxpDIGIV2468JAsf6RcG90ex2FGu8RwlZMEaMIGLcvfDA+0g/
 GiBGFDYw2Ou3CyYclkQToeD1CFUgwy+4/YOaCK7V3n0S/rGTuhvlR+lUO7IIzCKKfG2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hx/Z1QGIGo513DGFRHbMqQT6fmsKMlQd8/3rs/cumNc=; b=IxyTerMzPx9xp5W9OhjXYhXQwy
 2/J30bBG0GS9Lou0a4DxNky45DR5EOeXQahdoVlDCHTGrmAwXpsowLs/HP5svUhh50eb7Iv+6sxSS
 05RQRpg/Us2w0XhwwNuX5MyWvWWtoyTRRXUOhAM8bX2VjVVilrZH0BtS9BCVHVOv5Dgw=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puyS7-00FSH2-0S for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:38:42 +0000
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-3ef5bea20caso8388921cf.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683304711; x=1685896711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hx/Z1QGIGo513DGFRHbMqQT6fmsKMlQd8/3rs/cumNc=;
 b=GkBSjNyu1otJF1y2xLgNZ65G5TyDO9r6gs3avfQjCBRolXtxADWGH5Q/xBmVLrBE68
 wxcmXI10LyU6H5zbCFa3WTNCYHTqDVSBfLXVMPzpK3G8VX1miXCaegQtCpv/PcfCC3bM
 83FkPqkK/mduZ2SJdgJe93dcnMvUHw9pAemvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304711; x=1685896711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hx/Z1QGIGo513DGFRHbMqQT6fmsKMlQd8/3rs/cumNc=;
 b=HRRyEi1rh7+qntBYLKVeIidnn1D2HXzJUEuoIyosqrD4JrltqkUJ0g/W/5+oBwEnbv
 ozEbES1tFSZPeK+NoTKeyFVIiLuOKLsiDIF7J++dLruMlGCT9ZBQcQI/Zkcy2jdqH1kq
 61b7FKNuokksKa1MAkVDjniqrN2CO60WVTuaU4ZJpK6+eJ1bhWxyNVvSOlzoGMMpljS/
 4WS+tjk01mwx2zEz3V0UEJ0rJtjEEumMgxxcZ3K7a8jQ+XObdqO2jwh9Y0xIXB4oGHN4
 D5NhIFNHhhnVf6SB5oW9KD34lsKNqbyDI8KmvUTTJrlUsaMHmJ7HU8q6JIDVFJFko/cv
 PNmg==
X-Gm-Message-State: AC+VfDw3pL/wWIhEZ/uayOX5gCgYt7xTbdgcZuQSOAJqe0O74Z80UDaL
 lyNP13cb4D3dk1oWmpZdhq0mP47s+BAnCxy6Eto=
X-Google-Smtp-Source: ACHHUZ6NWcVxnBJWNLI7ddqTArNGsIu96H8ewFyVcPBI930GFJ896UC96kX7rp8OAdHS0Rn2HeMDog==
X-Received: by 2002:a05:622a:4:b0:3bd:1a8a:8015 with SMTP id
 x4-20020a05622a000400b003bd1a8a8015mr3414941qtw.16.1683304711302; 
 Fri, 05 May 2023 09:38:31 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 g3-20020ae9e103000000b0074357fa9e15sm702021qkm.42.2023.05.05.09.38.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 09:38:29 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-3ef36d814a5so1117711cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:38:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1898:b0:3ef:31a5:13c with SMTP id
 v24-20020a05622a189800b003ef31a5013cmr206117qtc.3.1683304708084; Fri, 05 May
 2023 09:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
 <CSE0CI3TFK72.2I4E5TJIRHDGM@wheely>
In-Reply-To: <CSE0CI3TFK72.2I4E5TJIRHDGM@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:38:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vuad+gxrUirhyx8aFuLbh2M1hMnoY5NUVBxdycd8kFiQ@mail.gmail.com>
Message-ID: <CAD=FV=Vuad+gxrUirhyx8aFuLbh2M1hMnoY5NUVBxdycd8kFiQ@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, May 4, 2023 at 8:02 PM Nicholas Piggin <npiggin@gmail.com>
    wrote: > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: >
   > These are tiny style changes: > > - Add a blank line bef [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.171 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puyS7-00FSH2-0S
Subject: Re: [Kgdb-bugreport] [PATCH v4 08/17] watchdog/hardlockup: Style
 changes to watchdog_hardlockup_check() / ..._is_lockedup()
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

SGksCgpPbiBUaHUsIE1heSA0LCAyMDIzIGF0IDg6MDLigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSBNYXkgNSwgMjAyMyBhdCA4OjEzIEFN
IEFFU1QsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBUaGVzZSBhcmUgdGlueSBzdHlsZSBj
aGFuZ2VzOgo+ID4gLSBBZGQgYSBibGFuayBsaW5lIGJlZm9yZSBhICJyZXR1cm4iLgo+ID4gLSBS
ZW5hbWVzIHR3byBnbG9iYWxzIHRvIHVzZSB0aGUgIndhdGNoZG9nX2hsZCIgcHJlZml4Lgo+Cj4g
UGFydGljdWxhcmx5IHN0YXRpYyBvbmVzIGRvbid0IHJlYWxseSBuZWVkIHRoZSBuYW1lc3BhY2Ug
cHJlZml4ZXMuCgpSZW5hbWVzIGFyZSBtb3N0bHkgYXQgUGV0cidzIHJlcXVlc3QuIElmIEkndmUg
bWlzdW5kZXJzdG9vZCB3aGF0IGhlCndhbnRzIGhlcmUgdGhhdCBJJ20gaGFwcHkgdG8gcmVtb3Zl
IHRoZW0uCgoKPiBOb3Qgc3VyZSBpZiBwcm9jZXNzZWQgaXMgYmV0dGVyIHRoYW4gd2Fybi4KCkkg
Y2FuIHVuZG8gdGhpcyBvbmUgaWYgeW91IHdhbnQuIEl0IGZlbHQgbGlrZSB3ZSB3ZXJlIGRvaW5n
IG1vcmUgdGhhbgpqdXN0IHdhcm5pbmcsIGJ1dCBpZiBwZW9wbGUgdGhpbmsgIndhcm4iIGlzIGEg
YmV0dGVyIHdheSB0byBkZXNjcmliZQppdCB0aGVuIHRoYXQncyBmaW5lIHdpdGggbWUuCgoKPiBh
bGxjcHVfZHVtcGVkIGlzIGJldHRlcgo+IHRoYW4gZHVtcGVkX3N0YWNrcyB0aG91Z2ggYmVjYXVz
ZSB0aGUgYWxsLUNQVXMtZHVtcCBpcyBhIHBhcnRpY3VsYXIKPiB0aGluZy4KCk9LLCBJIGNhbiB1
bmRvIHRoaXMgYW5kIGxlYXZlIGl0IGFzICJhbGxjcHVfZHVtcGVkIi4KCgpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci9aRkVybXNoY3JjaWtyU1UxQGFsbGV5CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBs
aXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
