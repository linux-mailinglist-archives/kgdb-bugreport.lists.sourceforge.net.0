Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F86F4280
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 May 2023 13:17:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pto0r-00028Q-Rm
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 02 May 2023 11:17:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wenst@chromium.org>) id 1prAkw-0006B8-LF
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Apr 2023 04:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vKKkeNYy26t1TjKVwBgMLbds1eKVkw1hMyFByHcDzQ8=; b=cQM85rNrwQoy2PSGmwWDby4Bub
 G2SvAuH3um5n6y1EGFh2NC5sfNUb2WHK1Gs+ejQdCEj/GH3dPb+tcgxkhdyW0SawPV5MifrexsQ/x
 xRq/IKPbDcpG3s1hnoEaTFd4bPWZlcSevvM4tbTTyWKOITdQBgpSFHyqRGOy9n3Xpsdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vKKkeNYy26t1TjKVwBgMLbds1eKVkw1hMyFByHcDzQ8=; b=buNVZc6roET2DTV/Cj6sCcj5hW
 7ebLLeYFVm4qsQRHavLgYVyE8PMvGzXBZnHKNC2fjmqKd2euRX5CtsFaRkUpvpHtSK5/BqqyTCiXD
 884Kw0tHE8ctd9CEGRS/70HJppwj7mzGI79Cqr9BVguY8xF8e0dNU3+EhWNqk848crUA=;
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1prAks-0001SU-Jm for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Apr 2023 04:58:22 +0000
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-77202f9d028so1820371241.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 21:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682398692; x=1684990692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKKkeNYy26t1TjKVwBgMLbds1eKVkw1hMyFByHcDzQ8=;
 b=dClWn8nq9rhEMd87NqePK0FRmC3PDIyZw3hNI4Y6kWzhsoOdCrl23hkYVmMtLxs0eB
 BAsWynnRwqY4Uo2vZFhLHqfVcBHwutaEM3DB0UweV6tlcoX/qc9tPAOSt26d7bl6hIsE
 hUu9Hw6PAg8ceY58RXg9Sl/hl1RlCY7CY8vhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682398692; x=1684990692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKKkeNYy26t1TjKVwBgMLbds1eKVkw1hMyFByHcDzQ8=;
 b=Hed67xNW0Ry/jWk6nb9KlyStdhCaBiCjnYmBfyzGu4PSOBL5izuRFLpx+rMLPsX1Qo
 4TbwuxzQ4CYh5pLVLjGyfOlSRhPT/Ajunjb7BHwQqkknVMyervPSR+E0rBO7nGFaroVj
 v5qccTY6uCqMujDfCM5hbA0OmLYr9ooA/ZjV6rfMNAAgMMNiZd3vYGhtdx/v3M4Xq4+4
 ngMehqVpLAr8oXzjMtbENq+tcXU1o8Rf5TWFDftlTlsMoOGIv0NehFo8aI4ryveY0vPa
 gARBRLU6Sepggn3MQBQjhcbFpQFhK3tMvr83OXer+g9EVRj42sxNvaM+mEUaZ4OaQIpk
 Ck5w==
X-Gm-Message-State: AAQBX9dAO3X7fHEqCEcEYLjgOHdMl/XVUbIXwtJFYyyPmyuQSInA0xSm
 lKD+Or6A6tWM6GCIe0FF4gEPaf+Ln4+HqMJj5FRmQA==
X-Google-Smtp-Source: AKy350YV9yq/BYIVC0vQ1BiX8lbq0Q/kk/Y+qtOenk4wtXVHcFqYgVVennu93j8KBIiSa0redLYnm3nczDpo6ZTYECw=
X-Received: by 2002:a1f:cb02:0:b0:43f:a097:5e8c with SMTP id
 b2-20020a1fcb02000000b0043fa0975e8cmr3429523vkg.16.1682398692723; Mon, 24 Apr
 2023 21:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <20230424125355.GA4054@aspen.lan>
 <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
In-Reply-To: <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Apr 2023 12:58:01 +0800
Message-ID: <CAGXv+5Gbph1r0u_NVBS7Lg8w8X4Qw0Q=yxmEkJDs4ptOJu2NVA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 24, 2023 at 11:42 PM Doug Anderson <dianders@chromium.org>
    wrote: > > Hi, > > On Mon, Apr 24, 2023 at 5:54 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > On Fri, Apr [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1prAks-0001SU-Jm
X-Mailman-Approved-At: Tue, 02 May 2023 11:16:07 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] hardlockup: detect hard lockups using
 secondary (buddy) cpus
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexander Potapenko <glider@google.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Vlastimil Babka <vbabka@suse.cz>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Miguel Ojeda <ojeda@kernel.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Marco Elver <elver@google.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgMTE6NDLigK9QTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVy
c0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIEFwciAyNCwgMjAyMyBh
dCA1OjU04oCvQU0gRGFuaWVsIFRob21wc29uCj4gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3Jn
PiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEFwciAyMSwgMjAyMyBhdCAwMzo1MzozMFBNIC0wNzAw
LCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gPiBGcm9tOiBDb2xpbiBDcm9zcyA8Y2Nyb3Nz
QGFuZHJvaWQuY29tPgo+ID4gPgo+ID4gPiBJbXBsZW1lbnQgYSBoYXJkbG9ja3VwIGRldGVjdG9y
IHRoYXQgY2FuIGJlIGVuYWJsZWQgb24gU01QIHN5c3RlbXMKPiA+ID4gdGhhdCBkb24ndCBoYXZl
IGFuIGFyY2ggcHJvdmlkZWQgb25lIG9yIG9uZSBpbXBsZW1lbnRlZCBhdG9wIHBlcmYgYnkKPiA+
ID4gdXNpbmcgaW50ZXJydXB0cyBvbiBvdGhlciBjcHVzLiBFYWNoIGNwdSB3aWxsIHVzZSBpdHMg
c29mdGxvY2t1cAo+ID4gPiBocnRpbWVyIHRvIGNoZWNrIHRoYXQgdGhlIG5leHQgY3B1IGlzIHBy
b2Nlc3NpbmcgaHJ0aW1lciBpbnRlcnJ1cHRzIGJ5Cj4gPiA+IHZlcmlmeWluZyB0aGF0IGEgY291
bnRlciBpcyBpbmNyZWFzaW5nLgo+ID4gPgo+ID4gPiBOT1RFOiB1bmxpa2UgdGhlIG90aGVyIGhh
cmQgbG9ja3VwIGRldGVjdG9ycywgdGhlIGJ1ZGR5IG9uZSBjYW4ndAo+ID4gPiBlYXNpbHkgcHJv
dmlkZSBhIGJhY2t0cmFjZSBvbiB0aGUgQ1BVIHRoYXQgbG9ja2VkIHVwLiBJdCByZWxpZXMgb24K
PiA+ID4gc29tZSBvdGhlciBtZWNoYW5pc20gaW4gdGhlIHN5c3RlbSB0byBnZXQgaW5mb3JtYXRp
b24gYWJvdXQgdGhlIGxvY2tlZAo+ID4gPiB1cCBDUFVzLiBUaGlzIGNvdWxkIGJlIHN1cHBvcnQg
Zm9yIE5NSSBiYWNrdHJhY2VzIGxpa2UgWzFdLCBpdCBjb3VsZAo+ID4gPiBiZSBhIG1lY2hhbmlz
bSBmb3IgcHJpbnRpbmcgdGhlIFBDIG9mIGxvY2tlZCBDUFVzIGxpa2UgWzJdLCBvciBpdAo+ID4g
PiBjb3VsZCBiZSBzb21ldGhpbmcgZWxzZS4KPiA+ID4KPiA+ID4gVGhpcyBzdHlsZSBvZiBoYXJk
bG9ja3VwIGRldGVjdG9yIG9yaWdpbmF0ZWQgaW4gc29tZSBkb3duc3RyZWFtCj4gPiA+IEFuZHJv
aWQgdHJlZXMgYW5kIGhhcyBiZWVuIHJlYmFzZWQgb24gLyBjYXJyaWVkIGluIENocm9tZU9TIHRy
ZWVzIGZvcgo+ID4gPiBxdWl0ZSBhIGxvbmcgdGltZSBmb3IgdXNlIG9uIGFybSBhbmQgYXJtNjQg
Ym9hcmRzLiBIaXN0b3JpY2FsbHkgb24KPiA+ID4gdGhlc2UgYm9hcmRzIHdlJ3ZlIGxldmVyYWdl
ZCBtZWNoYW5pc20gWzJdIHRvIGdldCBpbmZvcm1hdGlvbiBhYm91dAo+ID4gPiBodW5nIENQVXMs
IGJ1dCB3ZSBjb3VsZCBtb3ZlIHRvIFsxXS4KPiA+Cj4gPiBPbiB0aGUgQXJtIHBsYXRmb3JtcyBp
cyB0aGlzIGNvZGUgYWJsZSB0byBsZXZlcmFnZSB0aGUgZXhpc3RpbmcKPiA+IGluZnJhc3RydWN0
dXJlIHRvIGV4dHJhY3Qgc3RhdHVzIGZyb20gc3R1Y2sgQ1BVczoKPiA+IGh0dHBzOi8vZG9jcy5r
ZXJuZWwub3JnL3RyYWNlL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3B1LWRlYnVnLmh0bWwKPgo+IFl1
cCEgSSB3YXNuJ3QgZXhwbGljaXQgYWJvdXQgdGhpcywgYnV0IHRoYXQncyB3aGVyZSB5b3UgZW5k
IHVwIGlmIHlvdQo+IGZvbGxvdyB0aGUgd2hvbGUgYnVnIHRyYWNrZXIgaXRlbSB0aGF0IHdhcyBs
aW5rZWQgYXMgWzJdLgo+IFNwZWNpZmljYWxseSwgd2UgdXNlZCB0byBoYXZlIGRvd25zdHJlYW0g
cGF0Y2hlcyBpbiB0aGUgQ2hyb21lT1MgdGhhdAo+IGp1c3QgcmVhY2hlZCBpbnRvIHRoZSBjb3Jl
c2lnaHQgcmFuZ2UgZnJvbSBhIFNvQyBzcGVjaWZpYyBkcml2ZXIgYW5kCj4gcHJpbnRlZCBvdXQg
dGhlIENQVV9EQkdQQ1NSLiBXaGVuIEJyaWFuIHdhcyB1cHJldnZpbmcgcmszMzk5Cj4gQ2hyb21l
Ym9va3MgaGUgZm91bmQgdGhhdCB0aGUgZXF1aXZhbGVudCBmdW5jdGlvbmFsaXR5IGhhZCBtYWRl
IGl0Cj4gdXBzdHJlYW0gaW4gYSBnZW5lcmljIHdheSB0aHJvdWdoIHRoZSBjb3Jlc2lnaHQgZnJh
bWV3b3JrLiBCcmlhbgo+IGNvbmZpcm1lZCBpdCB3YXMgd29ya2luZyBvbiByazMzOTkgYW5kIG1h
ZGUgYWxsIG9mIHRoZSBkZXZpY2UgdHJlZQo+IGNoYW5nZXMgbmVlZGVkIHRvIGdldCBpdCBhbGwg
aG9va2VkIHVwLCBzbyAoYXQgbGVhc3QgZm9yIHRoYXQgU29DKSBpdAo+IHNob3VsZCB3b3JrIG9u
IHRoYXQgU29DLgo+Cj4gWzJdIGh0dHBzOi8vaXNzdWV0cmFja2VyLmdvb2dsZS5jb20vMTcyMjEz
MTI5CgpJSVJDIHdpdGggdGhlIGNvcmVzaWdodCBDUFUgZGVidWcgZHJpdmVyIGVuYWJsZWQgYW5k
IHRoZSBwcm9wZXIgRFQgbm9kZXMKYWRkZWQsIHRoZSBwYW5pYyBoYW5kbGVyIGRvZXMgZHVtcCBv
dXQgaW5mb3JtYXRpb24gZnJvbSB0aGUgaGFyZHdhcmUuCkkgZG9uJ3QgdGhpbmsgaXQncyB3aXJl
ZCB1cCBmb3IgaHVuZyB0YXNrcyB0aG91Z2guCgpDaGVuWXUKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QK
S2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
