Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A47016F7924
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:29:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhSN-0005YZ-4c
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:29:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhSL-0005YT-2p
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z4uBgz0yZBTHWQuliVmtKoGkSIHeFOTfO6AJGNbOg9A=; b=DaEjpLqKWPI+bXHVRUFisgpjLt
 QIQtTvBz9bVU+PfcG97GKhdhOsrEIbnLSxhv0I+yd8V8TFvvadDHF5nF6OnDevZPRHvvFk5Y0HOy4
 aah+XavDhXlximTCqXkRRaMAaPVI+vKNSTC4VaXBIBgoXZvdYd1oA2M3ty6u03omOOHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z4uBgz0yZBTHWQuliVmtKoGkSIHeFOTfO6AJGNbOg9A=; b=RYL34lmaCXozOBk8zE8AuJNU8R
 P8vD5NfK7Tw192FokpOotC+pwcZ5GVSkr3GItfK5nP8sppbyH0WwDBNdJeyDvflRLp91dOaQKyZHO
 spVipciIxHfQAjrkLMbriqVc1sCQtcEbom2H8+Yh0VRAqo7OOUHDRC9HvPBy3yYvJWLw=;
Received: from mail-qt1-f174.google.com ([209.85.160.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhSG-00ETmi-O1 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:29:45 +0000
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-3ef49c15454so5233141cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683239373; x=1685831373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4uBgz0yZBTHWQuliVmtKoGkSIHeFOTfO6AJGNbOg9A=;
 b=mRH2183y29Fs8b7BsfSui78hnyxN7enKzRHIneykhssnqgMnWo/IghMoPEomeILD/v
 GFyfW6ehjr0BtXFzZ5iXCn+3iKnWGezusUqkoB2TpHEfAZ9fK3ULSJXP68X8kxnAbWQF
 5SvZBmRwMsiIwA59aVE5W3ia24c52oP+Wm4Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683239373; x=1685831373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4uBgz0yZBTHWQuliVmtKoGkSIHeFOTfO6AJGNbOg9A=;
 b=XnrPU6bykB6GyOG3pa9EXELYP4y67P9SSs+7vEJa/DyLyuTf4BNT8Kv9Qs52PRClsZ
 yr3r6iZfSIFRDei/n8z4BAKBu/3c4C6i9B5kTjq8cJ4vVW8Xsz+J4FmV5/eCC3WE+LD8
 Y3lyj/2jKKoSqamSxj2Udr28Z27YETxjfSu+BpYleSK2JIg0A9UPPmW1/pCa2ooeCVx2
 tDZjNx8CgDO+G/z8fCz2nNj+I1nSHMrekkFuK7dZNl+7aw9CEI35T2pnXzsMM8NFSlb/
 2NoulX/o7g73cILukSv2qBR3HAYpLbgt/KtPEcyPCl/MacWzUptPDnQZ5gruRm5dE85e
 WQcw==
X-Gm-Message-State: AC+VfDx6PPWABnds6/IOYQ2JsY55GgkcE2U0eWppMXnhDbF9Pccuj1c7
 hNseFKL77IY88gn7YBXHtpRevy/vOxJI/csi1PU=
X-Google-Smtp-Source: ACHHUZ4QY0w/eiydQSAX6vbOgXH3dKP8B5zjBH1ZimoWJZBvrOiwnliuvzBug2LVlEj5oDd/2ZMyAA==
X-Received: by 2002:a05:622a:492:b0:3ef:3541:4362 with SMTP id
 p18-20020a05622a049200b003ef35414362mr8682906qtx.4.1683239373258; 
 Thu, 04 May 2023 15:29:33 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 fv18-20020a05622a4a1200b003dd8ad765dcsm37113qtb.76.2023.05.04.15.29.31
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 15:29:32 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-3ef34c49cb9so886271cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:29:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:3f3:75c2:7466 with SMTP id
 t7-20020a05622a148700b003f375c27466mr43810qtx.8.1683239371523; Thu, 04 May
 2023 15:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <ZFErmshcrcikrSU1@alley>
In-Reply-To: <ZFErmshcrcikrSU1@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 May 2023 15:29:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UVFR5YvJ8QrZ8YYPpwzYeymuy_JhcmZknbwUXg9njoGA@mail.gmail.com>
Message-ID: <CAD=FV=UVFR5YvJ8QrZ8YYPpwzYeymuy_JhcmZknbwUXg9njoGA@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, May 2, 2023 at 8:26 AM Petr Mladek <pmladek@suse.com>
    wrote: > > > +int __weak watchdog_nmi_enable(unsigned int cpu) { return 0;
    } > > +void __weak watchdog_nmi_disable(unsigned int cpu) { r [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.174 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhSG-00ETmi-O1
Subject: Re: [Kgdb-bugreport] shared code: was: Re: [PATCH v3] hardlockup:
 detect hard lockups using secondary (buddy) CPUs
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
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>, Vlastimil Babka <vbabka@suse.cz>,
 Sami Tolvanen <samitolvanen@google.com>, kgdb-bugreport@lists.sourceforge.net,
 Miguel Ojeda <ojeda@kernel.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIE1heSAyLCAyMDIzIGF0IDg6MjbigK9BTSBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiA+ICtpbnQgX193ZWFrIHdhdGNoZG9nX25taV9lbmFibGUo
dW5zaWduZWQgaW50IGNwdSkgeyByZXR1cm4gMDsgfQo+ID4gK3ZvaWQgX193ZWFrIHdhdGNoZG9n
X25taV9kaXNhYmxlKHVuc2lnbmVkIGludCBjcHUpIHsgcmV0dXJuOyB9Cj4KPiBIb25lc3RseSwg
dGhlIG1peCBvZiBzb2Z0bG9ja3VwIGFuZCBoYXJkbG9ja3VwIGNvZGUgd2FzIGEgaGFyZCB0bwo+
IGZvbGxvdyBldmVuIGJlZm9yZSB0aGlzIHBhdGNoLiBBbmQgaXQgaXMgZ29pbmcgdG8gYmUgd29y
c2UuCj4KPiBBbnl3YXksIHRoZSBidWRkeSB3YXRjaGRvZyBpcyBub3QgdXNpbmcgTk1JIGF0IGFs
bC4gSXQgc2hvdWxkIG5vdAo+IGdldCBlbmFibGUgdXNpbmcgYSBmdW5jdGlvbiBjYWxsZWQgKl9u
bWlfZW5hYmxlZCgpLgoKVGhhbmtzIGZvciB5b3VyIHJldmlldyEgSSdtIG5vdCBnb2luZyB0byBp
bmRpdmlkdWFsbHkgcmVwbHkgdG8gYWxsCnlvdXIgY29tbWVudHMgYmVsb3csIGJ1dCBJJ3ZlIHNl
bnQgb3V0IGEgdjQgWzFdIHdoZXJlIEkgdGhpbmsgSSd2ZQpkb25lIGEgc2VtaS1kZWNlbnQgam9i
IG9mIG1ha2luZyB0aGlzIGEgbGl0dGxlIGNsZWFuZXIgKG5vdCBwZXJmZWN0LApidXQgaG9wZWZ1
bGx5IGEgc3RlcCBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uKS4gUGxlYXNlIHRha2UgYSBsb29rLgoK
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA1MDQyMjEzNDkuMTUzNTY2OS0xLWRp
YW5kZXJzQGNocm9taXVtLm9yZwoKCj4gQWxzbyBzb21lIGNvbW1lbnRzIGFyZSBub3QgbG9uZ2Vy
IHZhbGlkLCBmb3IgZXhhbXBsZToKPgo+IHN0YXRpYyB2b2lkIHdhdGNoZG9nX2VuYWJsZSh1bnNp
Z25lZCBpbnQgY3B1KQo+IHsKPiBbLi4uXQo+ICAgICAgICAgLyogRW5hYmxlIHRoZSBwZXJmIGV2
ZW50ICovCj4gICAgICAgICBpZiAod2F0Y2hkb2dfZW5hYmxlZCAmIE5NSV9XQVRDSERPR19FTkFC
TEVEKQo+ICAgICAgICAgICAgICAgICB3YXRjaGRvZ19ubWlfZW5hYmxlKGNwdSk7CgpVZ2gsIGFm
dGVyIEkgc2VudCB0aGUgbmV3IHZlcnNpb24gSSBqdXN0IHJlYWxpemVkIHRoYXQgSSBtaXNzZWQK
dXBkYXRpbmcgdGhlIGFib3ZlIGNvbW1lbnQuIDooIElmIEkgbmVlZCB0byBzZW5kIGEgdjUgSSBj
YW4gdXBkYXRlIGl0CnRoZW4sIG9yIGlmIHY0IGxhbmRzIEkgY2FuIHNlbmQgYSBmb2xsb3ctb24g
cGF0Y2ggdG8gdXBkYXRlIHRoYXQKY29tbWVudC4gTXkgZXllcyBhcmUgZ2xhemVkIG92ZXIgZW5v
dWdoIGZyb20gdHJ5aW5nIHRvIG9yZ2FuaXplIGEKMTctcGF0Y2ggc2VyaWVzLCBzbyBJIHNvbWV3
aGF0IGltYWdpbmUgaXQncyBub3QgdGhlIG9ubHkgY29tbWVudCBJCm1pc3NlZC4uLgoKLURvdWcK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1
Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVw
b3J0Cg==
