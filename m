Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F36ED15D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Apr 2023 17:31:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pqy9z-0003Oo-7J
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 24 Apr 2023 15:31:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pqy9x-0003Oi-Ta
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pQQ0l1rf0aXXyplq/mgF2Rjc0pUjLq2PlqK5LzTpLjw=; b=csgNizMYScl7U5+pgP2NURZF+l
 FINMxtPcLr3ITU1iVWVxLgKCCej8dFd1TWAPpcEQgHk/hOgUKaA9ncZPAzffUXxbnQGz26kkrvbC4
 9QF8M9tw8cng+woFILdX1oAmlOhoPm8x4ZH5yDG7qo5ZtB1P3wrUABsfj64FoHY6uZCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pQQ0l1rf0aXXyplq/mgF2Rjc0pUjLq2PlqK5LzTpLjw=; b=UUybEjdXMUBxeCFnVC/vGvqN93
 93f1e64hEWYPXqggv2nrKxlgcDhi/R9glI55DpqgClSEnKjIWqs1waGEQamCxXU78WQd+7+b7fCEf
 qVDjyG6uBsz5M1EE1ElpWXrt/S51RqT0eNj0rE1UgnOk6Lvypr/dFrdYt7IGoKnvtx7o=;
Received: from mail-il1-f180.google.com ([209.85.166.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pqy9w-0007oi-6C for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:31:21 +0000
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-329465f10fbso12264015ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682350274; x=1684942274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQQ0l1rf0aXXyplq/mgF2Rjc0pUjLq2PlqK5LzTpLjw=;
 b=UM4mcuR7EEeK2N343d7KtAR8c83QPLw4kGMFoUDEWILYFsQ8HpcYa0ESk21rGzqdC2
 W/fsRTw8pI63Lplxy35JBf8tDL1LWyY6NWuV0vB5xNEHnOvIAcEqpJvkQolvkzDtj+qp
 OFds0S7HXQIwB9qLTS8wEFQYxagfvvpVYSE7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350274; x=1684942274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQQ0l1rf0aXXyplq/mgF2Rjc0pUjLq2PlqK5LzTpLjw=;
 b=RIXKizVGW2MFY3VNk1ivG5h5Aq3w6yFc7Ev47QIUQAGuYVORh0MfjYejnWMv0W/vDa
 opqvURZIOVZHorztuz4La63lHpgxaZ0+tVRqo8nSay6s8iYKzlaiVkeXaCBJWnkSqMHM
 ERRcvxSPNBsMji6zDZFHcMMkqj70M6Yqn6hMjJbgZLMJiSKxjRM5qSO/HQkyHNPCTQ/h
 r3POB3XEv5Nrx+h9xhjOk7DfTSr3Ye3U7h8fwmKMl6zJSiDlCwmdFFt1cTDbkqbzbvFK
 zbg6/TTY/Xy/VKViCLYxNrnYSJ2XydUDDzqh/2g2Pi3GLt1du1/80P6EXRBoC6zr4VRw
 5G7g==
X-Gm-Message-State: AAQBX9fGG7Whn71UDDaeH4LQZmS0TD5PtAVwoFGh4P4XwYIieD0SLI9P
 0eoValODWFGg4yP7WzOPtV+Wjnfmt/1gaZ1qkPw=
X-Google-Smtp-Source: AKy350ZNgA9WGcUC7B02i/4RbVmnMo3WJuOgDibiODNuVAzNaY1cwY0+SGIQgc+uq93d9gQxdy+R4A==
X-Received: by 2002:a92:501:0:b0:328:6172:a745 with SMTP id
 q1-20020a920501000000b003286172a745mr6076888ile.17.1682350274029; 
 Mon, 24 Apr 2023 08:31:14 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169]) by smtp.gmail.com with ESMTPSA id
 n6-20020a922606000000b0032627025623sm3065860ile.73.2023.04.24.08.31.13
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:31:13 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-325f728402cso1066795ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 08:31:13 -0700 (PDT)
X-Received: by 2002:a92:ca0a:0:b0:32a:7910:6ea6 with SMTP id
 j10-20020a92ca0a000000b0032a79106ea6mr527671ils.5.1682349853334; Mon, 24 Apr
 2023 08:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CAP-5=fUB1e=bJk-w0i8+MEo4sLOZtb_Eb7FMy4u7ky7D2AZm6A@mail.gmail.com>
In-Reply-To: <CAP-5=fUB1e=bJk-w0i8+MEo4sLOZtb_Eb7FMy4u7ky7D2AZm6A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Apr 2023 08:23:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
Message-ID: <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Apr 21, 2023 at 6:20 PM Ian Rogers <irogers@google.com>
    wrote: > > On Fri, Apr 21, 2023 at 3:54 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > > > From: Colin Cross <ccross@android [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.180 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pqy9w-0007oi-6C
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Petr Mladek <pmladek@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Vlastimil Babka <vbabka@suse.cz>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Miguel Ojeda <ojeda@kernel.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Marco Elver <elver@google.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-mediatek@lists.infradead.org, Zhen Lei <thunder.leizhen@huawei.com>,
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

SGksCgpPbiBGcmksIEFwciAyMSwgMjAyMyBhdCA2OjIw4oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vy
c0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDM6NTTigK9Q
TSBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+
IEZyb206IENvbGluIENyb3NzIDxjY3Jvc3NAYW5kcm9pZC5jb20+Cj4gPgo+ID4gSW1wbGVtZW50
IGEgaGFyZGxvY2t1cCBkZXRlY3RvciB0aGF0IGNhbiBiZSBlbmFibGVkIG9uIFNNUCBzeXN0ZW1z
Cj4gPiB0aGF0IGRvbid0IGhhdmUgYW4gYXJjaCBwcm92aWRlZCBvbmUgb3Igb25lIGltcGxlbWVu
dGVkIGF0b3AgcGVyZiBieQo+ID4gdXNpbmcgaW50ZXJydXB0cyBvbiBvdGhlciBjcHVzLiBFYWNo
IGNwdSB3aWxsIHVzZSBpdHMgc29mdGxvY2t1cAo+ID4gaHJ0aW1lciB0byBjaGVjayB0aGF0IHRo
ZSBuZXh0IGNwdSBpcyBwcm9jZXNzaW5nIGhydGltZXIgaW50ZXJydXB0cyBieQo+ID4gdmVyaWZ5
aW5nIHRoYXQgYSBjb3VudGVyIGlzIGluY3JlYXNpbmcuCj4gPgo+ID4gTk9URTogdW5saWtlIHRo
ZSBvdGhlciBoYXJkIGxvY2t1cCBkZXRlY3RvcnMsIHRoZSBidWRkeSBvbmUgY2FuJ3QKPiA+IGVh
c2lseSBwcm92aWRlIGEgYmFja3RyYWNlIG9uIHRoZSBDUFUgdGhhdCBsb2NrZWQgdXAuIEl0IHJl
bGllcyBvbgo+ID4gc29tZSBvdGhlciBtZWNoYW5pc20gaW4gdGhlIHN5c3RlbSB0byBnZXQgaW5m
b3JtYXRpb24gYWJvdXQgdGhlIGxvY2tlZAo+ID4gdXAgQ1BVcy4gVGhpcyBjb3VsZCBiZSBzdXBw
b3J0IGZvciBOTUkgYmFja3RyYWNlcyBsaWtlIFsxXSwgaXQgY291bGQKPiA+IGJlIGEgbWVjaGFu
aXNtIGZvciBwcmludGluZyB0aGUgUEMgb2YgbG9ja2VkIENQVXMgbGlrZSBbMl0sIG9yIGl0Cj4g
PiBjb3VsZCBiZSBzb21ldGhpbmcgZWxzZS4KPiA+Cj4gPiBUaGlzIHN0eWxlIG9mIGhhcmRsb2Nr
dXAgZGV0ZWN0b3Igb3JpZ2luYXRlZCBpbiBzb21lIGRvd25zdHJlYW0KPiA+IEFuZHJvaWQgdHJl
ZXMgYW5kIGhhcyBiZWVuIHJlYmFzZWQgb24gLyBjYXJyaWVkIGluIENocm9tZU9TIHRyZWVzIGZv
cgo+ID4gcXVpdGUgYSBsb25nIHRpbWUgZm9yIHVzZSBvbiBhcm0gYW5kIGFybTY0IGJvYXJkcy4g
SGlzdG9yaWNhbGx5IG9uCj4gPiB0aGVzZSBib2FyZHMgd2UndmUgbGV2ZXJhZ2VkIG1lY2hhbmlz
bSBbMl0gdG8gZ2V0IGluZm9ybWF0aW9uIGFib3V0Cj4gPiBodW5nIENQVXMsIGJ1dCB3ZSBjb3Vs
ZCBtb3ZlIHRvIFsxXS4KPiA+Cj4gPiBOT1RFOiB0aGUgYnVkZHkgc3lzdGVtIGlzIG5vdCByZWFs
bHkgdXNlZnVsIHRvIGVuYWJsZSBvbiBhbnkKPiA+IGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlIGEg
YmV0dGVyIG1lY2hhbmlzbS4gT24gYXJtNjQgZm9sa3MgaGF2ZSBiZWVuCj4gPiB0cnlpbmcgdG8g
Z2V0IGEgYmV0dGVyIG1lY2hhbmlzbSBmb3IgeWVhcnMgYW5kIHRoZXJlIGhhcyBldmVuIGJlZW4K
PiA+IHJlY2VudCBwb3N0cyBvZiBwYXRjaGVzIGFkZGluZyBzdXBwb3J0IFszXS4gSG93ZXZlciwg
bm90aGluZyBhYm91dCB0aGUKPiA+IGJ1ZGR5IHN5c3RlbSBpcyB0aWVkIHRvIGFybTY0IGFuZCBz
ZXZlcmFsIGFyY2hzIChldmVuIGFybTMyLCB3aGVyZSBpdAo+ID4gd2FzIG9yaWdpbmFsbHkgZGV2
ZWxvcGVkKSBjb3VsZCBmaW5kIGl0IHVzZWZ1bC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIzMDQxOTIyNTYwNC4yMTIwNC0xLWRpYW5kZXJzQGNocm9taXVtLm9yZwo+
ID4gWzJdIGh0dHBzOi8vaXNzdWV0cmFja2VyLmdvb2dsZS5jb20vMTcyMjEzMTI5Cj4gPiBbM10g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIyMDkwMzA5MzQxNS4x
NTg1MC0xLWxlY29wemVyLmNoZW5AbWVkaWF0ZWsuY29tLwo+Cj4gVGhlcmUgaXMgYW5vdGhlciBw
cm9wb3NhbCB0byB1c2UgdGltZXJzIGZvciBsb2NrdXAgZGV0ZWN0aW9uIGJ1dCBub3QKPiB0aGUg
YnVkZHkgc3lzdGVtOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA0MTMwMzU4
NDQuR0EzMTYyMEByYW5lcmljYS1zdnIuc2MuaW50ZWwuY29tLwo+IEl0J2QgYmUgdmVyeSBnb29k
IHRvIGZyZWUgdXAgdGhlIGNvdW50ZXIgdXNlZCBieSB0aGUgY3VycmVudCBOTUkgd2F0Y2hkb2cu
CgpUaGFua3MgZm9yIHRoZSBsaW5rIQoKTG9va3MgbGlrZSB0aGF0IHNlcmllcyBpcyB4ODYgb25s
eSwgc28gSSB0aGluayB0aGF0ICR7U1VCSkVDVH0gcGF0Y2gKc2hvdWxkIHN0aWxsIG1vdmUgZm9y
d2FyZCBzaW5jZSBpdCBwcm92aWRlcyBhIHNvbHV0aW9uIHRoYXQgaXMgZ2VuZXJpYwphY3Jvc3Mg
YW55IHBsYXRmb3JtLiBJIGd1ZXNzIHRoZSBxdWVzdGlvbiBpczogaWYgdGhlIGJ1ZGR5IHN5c3Rl
bSBnZXRzCmxhbmRlZCB0aGVuIGlzIHRoZSBIUEVUIHNlcmllcyBzdGlsbCB3b3J0aHdoaWxlPyBJ
IGd1ZXNzIHRoZSBhbnN3ZXIgdG8KdGhhdCB3b3VsZCBkZXBlbmQgb24gd2hldGhlciB0aGUgSFBF
VC1iYXNlZCB3YXRjaGRvZyBoYXMgYW55CmFkdmFudGFnZXMgb3ZlciB0aGUgYnVkZHkgc3lzdGVt
LgoKSSdkIGltYWdpbmUgdGhhdCB0aGVyZSBjb3VsZCBiZSBzb21lIGNhc2VzIHdoZXJlIHRoZSBI
UEVUIHN5c3RlbSBjb3VsZApkZXRlY3QgbG9ja3VwcyB0aGF0IHRoZSBidWRkeSBzeXN0ZW0gY2Fu
J3QuIElmIF9hbGxfIENQVXMgaW4gdGhlCnN5c3RlbSBoYXZlIGludGVycnVwdHMgZGlzYWJsZWQg
dGhlbiB0aGUgYnVkZHkgc3lzdGVtIHdvbid0IGJlIGFibGUgdG8KcnVuLCBidXQgdGhlIEhQRVQg
c3lzdGVtIGNvdWxkIHJ1bi4gVGhhdCdzIGEgd2luIGZvciB0aGUgSFBFVCBzeXN0ZW0uClRoYXQg
YmVpbmcgc2FpZCwgSSBndWVzcyBJIGNvdWxkIGltYWdpbmUgdGhhdCB0aGVyZSBjb3VsZCBiZSBs
b2NrdXBzCnRoYXQgdGhlIGJ1ZGR5IHN5c3RlbSBjb3VsZCBkZXRlY3QgdGhhdCB0aGUgSFBFVCBz
eXN0ZW0gY291bGRuJ3QuIFRoZQpIUEVUIHN5c3RlbSBzZWVtcyB0byBoYXZlIGEgc2luZ2xlIENQ
VSBpbiBjaGFyZ2Ugb2YgcHJvY2Vzc2luZyB0aGUKbWFpbiBOTUkgYW5kIHRoZW4gdGhhdCBzaW5n
bGUgQ1BVIGlzIGluIGNoYXJnZSBvZiBjaGVja2luZyBhbGwgdGhlCm90aGVycy4gSWYgdGhhdCBz
aW5nbGUgQ1BVIGdvZXMgb3V0IHRvIGx1bmNoIHRoZW4gdGhlIHN5c3RlbSBjb3VsZG4ndApkZXRl
Y3QgaGFyZCBsb2NrdXBzLgoKSW4gYW55IGNhc2UsIEknbSBoYXBweSB0byBsZXQgb3RoZXJzIGRl
YmF0ZSBhYm91dCB0aGUgSFBFVCBzeXN0ZW0uIEZvcgpub3csIEknbGwgdGFrZSBteSBhY3Rpb24g
aXRlbXMgdG8gYmU6CgoxLiBNb2RpZnkgdGhlIHBhdGNoIGRlc2NyaXB0aW9uIGFuZCBLQ29uZmln
IHRvIGluY2x1ZGUgc29tZSBvZiB0aGUKc2FtZSBhZHZhbnRhZ2VzIHRoYXQgdGhlIEhQRVQgcGF0
Y2ggc2VyaWVzIHRhbGtzIGFib3V0IChmcmVlaW5nIHVwCnJlc291cmNlcykuCgoyLiBJbmNyZWFz
ZSBteSBDQyBsaXN0IGZvciB0aGUgbmV4dCB2ZXJzaW9uIGV2ZW4gbW9yZSB0byBpbmNsdWRlIHRo
ZQpwZW9wbGUgeW91IGFkZGVkIHRvIHRoaXMgdGhyZWFkIHdobyBoYXZlIGJlZW4gd29ya2luZyBv
biB0aGUgSFBFVApwYXRjaCBzZXJpZXMuCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2Ri
LWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
