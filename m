Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B494C6EE4B8
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Apr 2023 17:26:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1prKZ2-0000rQ-IV
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Apr 2023 15:26:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1prKYu-0000rG-V6
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Apr 2023 15:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cyqk2sw07jP79tLlZQcGC2Yi7zdVZiomYulq2SQLWdw=; b=k0pjKeg/SbF3JLEjNv+nhzwnjB
 sa1jtH6MBaL26TrX84ITQtxfK8AYqZFeaOL8PPI+5GLU8K2oiPFtbKRPZOX9RGszL8GcCRNojT5I0
 Yzw10Mg88+LCGbk0acYfyxUfbZRXDIq0rwWpaial8XHsMKp7eaJ/QYD3celhaiM4CBn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cyqk2sw07jP79tLlZQcGC2Yi7zdVZiomYulq2SQLWdw=; b=UM8v7JQje9sVwOQnb1uk2j0nI0
 MQdJKZRjcEckBcOqiPfu4kZkekQ8YO5R6BLFuncG9dc+BZ5RyJ1EcHmidK1cnoFl3ZGtkyzh1AnWg
 Qk4xOnL0Jzi6leg6M+ggzS77ZE4QMEdZ0oMAlUOsLVv1x8dzkY5mlt9QihH94z/tGiHo=;
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1prKYu-001IF3-Bm for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Apr 2023 15:26:37 +0000
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-329518648ebso47832145ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 25 Apr 2023 08:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682436389; x=1685028389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cyqk2sw07jP79tLlZQcGC2Yi7zdVZiomYulq2SQLWdw=;
 b=njZ/13VR95VQibwfoq6uSVBhc5xXX2LRf69H4zTSFYqY2Op8xWin3xBB+EyEfIePqv
 eo34mIOSsOpg7RuXk6qIHnub5t08HoEsuQZ86LC58UL5SnQp51tqJD2+E29aFcGdJgHk
 TNy7VBVDDee57mQeT3eSGToZg+Q8bz8YgVNU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682436389; x=1685028389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cyqk2sw07jP79tLlZQcGC2Yi7zdVZiomYulq2SQLWdw=;
 b=FWX8tVFKOmvm8LgHrsHtG/M1xLeLZOxIeLJeazud115XJnhdwXu+NPDnZociT4gtXc
 DD72tIbiaGkHLlEnZvOe/iAQ0X4PVWX6ZZgo3YZCW5bKGwGf/kqxmRjUGyQKAsy/hvAN
 gp+6JQ/1h844ycR9mBVphDV8VUwUqSbU1ZNHOlNGKRcp2dv/v4D9oWL90q50MMWIcHfr
 oxjlWXDXr73Tv445kU9s6wD++hIJqRLoqt7DnqnSg74JRW+2oLZsrskzstyw+taO1/V/
 zc1Ppo1GGVvKodIGbdfbnRQ4MipNY7vo16qHqFDwSe/A4e/wNMKL2G4Ok3iz7pbJ6BrF
 N2kQ==
X-Gm-Message-State: AAQBX9dsyCfGTxbRK/C18oHtckejEjwOa2h4nHezc34Jd+by0iF0sdtT
 9frVEj6o4D2zNiuSPflkXxVokUXz94Rs9mQaaiM=
X-Google-Smtp-Source: AKy350aebgokXv5lxquPf9t/JLDQl0z4I3rgbtmly/hGaG4HR1Rpbe4shzZeFtmtOOUH+p6h/8NYIg==
X-Received: by 2002:a92:c532:0:b0:32b:4b85:9ea7 with SMTP id
 m18-20020a92c532000000b0032b4b859ea7mr8658275ili.7.1682436388856; 
 Tue, 25 Apr 2023 08:26:28 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174]) by smtp.gmail.com with ESMTPSA id
 f19-20020a92b513000000b003284a800a9esm3715774ile.2.2023.04.25.08.26.27
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:26:27 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-32ec968434eso90845ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 25 Apr 2023 08:26:27 -0700 (PDT)
X-Received: by 2002:a92:cd8b:0:b0:32b:3dd3:4c9a with SMTP id
 r11-20020a92cd8b000000b0032b3dd34c9amr264823ilb.15.1682436387051; Tue, 25 Apr
 2023 08:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <20230424125355.GA4054@aspen.lan>
 <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
 <CAGXv+5Gbph1r0u_NVBS7Lg8w8X4Qw0Q=yxmEkJDs4ptOJu2NVA@mail.gmail.com>
In-Reply-To: <CAGXv+5Gbph1r0u_NVBS7Lg8w8X4Qw0Q=yxmEkJDs4ptOJu2NVA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Apr 2023 08:26:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-ftcnO+jUw9_cBOPjcpFcUGcOOKuq+XRNyRjUGNSQow@mail.gmail.com>
Message-ID: <CAD=FV=W-ftcnO+jUw9_cBOPjcpFcUGcOOKuq+XRNyRjUGNSQow@mail.gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 24, 2023 at 9:58 PM Chen-Yu Tsai <wenst@chromium.org>
    wrote: > > On Mon, Apr 24, 2023 at 11:42 PM Doug Anderson <dianders@chromium.org>
    wrote: > > > > Hi, > > > > On Mon, Apr 24, 2023 [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1prKYu-001IF3-Bm
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

SGksCgpPbiBNb24sIEFwciAyNCwgMjAyMyBhdCA5OjU44oCvUE0gQ2hlbi1ZdSBUc2FpIDx3ZW5z
dEBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgMTE6NDLi
gK9QTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+
IEhpLAo+ID4KPiA+IE9uIE1vbiwgQXByIDI0LCAyMDIzIGF0IDU6NTTigK9BTSBEYW5pZWwgVGhv
bXBzb24KPiA+IDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IE9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDAzOjUzOjMwUE0gLTA3MDAsIERvdWdsYXMgQW5kZXJz
b24gd3JvdGU6Cj4gPiA+ID4gRnJvbTogQ29saW4gQ3Jvc3MgPGNjcm9zc0BhbmRyb2lkLmNvbT4K
PiA+ID4gPgo+ID4gPiA+IEltcGxlbWVudCBhIGhhcmRsb2NrdXAgZGV0ZWN0b3IgdGhhdCBjYW4g
YmUgZW5hYmxlZCBvbiBTTVAgc3lzdGVtcwo+ID4gPiA+IHRoYXQgZG9uJ3QgaGF2ZSBhbiBhcmNo
IHByb3ZpZGVkIG9uZSBvciBvbmUgaW1wbGVtZW50ZWQgYXRvcCBwZXJmIGJ5Cj4gPiA+ID4gdXNp
bmcgaW50ZXJydXB0cyBvbiBvdGhlciBjcHVzLiBFYWNoIGNwdSB3aWxsIHVzZSBpdHMgc29mdGxv
Y2t1cAo+ID4gPiA+IGhydGltZXIgdG8gY2hlY2sgdGhhdCB0aGUgbmV4dCBjcHUgaXMgcHJvY2Vz
c2luZyBocnRpbWVyIGludGVycnVwdHMgYnkKPiA+ID4gPiB2ZXJpZnlpbmcgdGhhdCBhIGNvdW50
ZXIgaXMgaW5jcmVhc2luZy4KPiA+ID4gPgo+ID4gPiA+IE5PVEU6IHVubGlrZSB0aGUgb3RoZXIg
aGFyZCBsb2NrdXAgZGV0ZWN0b3JzLCB0aGUgYnVkZHkgb25lIGNhbid0Cj4gPiA+ID4gZWFzaWx5
IHByb3ZpZGUgYSBiYWNrdHJhY2Ugb24gdGhlIENQVSB0aGF0IGxvY2tlZCB1cC4gSXQgcmVsaWVz
IG9uCj4gPiA+ID4gc29tZSBvdGhlciBtZWNoYW5pc20gaW4gdGhlIHN5c3RlbSB0byBnZXQgaW5m
b3JtYXRpb24gYWJvdXQgdGhlIGxvY2tlZAo+ID4gPiA+IHVwIENQVXMuIFRoaXMgY291bGQgYmUg
c3VwcG9ydCBmb3IgTk1JIGJhY2t0cmFjZXMgbGlrZSBbMV0sIGl0IGNvdWxkCj4gPiA+ID4gYmUg
YSBtZWNoYW5pc20gZm9yIHByaW50aW5nIHRoZSBQQyBvZiBsb2NrZWQgQ1BVcyBsaWtlIFsyXSwg
b3IgaXQKPiA+ID4gPiBjb3VsZCBiZSBzb21ldGhpbmcgZWxzZS4KPiA+ID4gPgo+ID4gPiA+IFRo
aXMgc3R5bGUgb2YgaGFyZGxvY2t1cCBkZXRlY3RvciBvcmlnaW5hdGVkIGluIHNvbWUgZG93bnN0
cmVhbQo+ID4gPiA+IEFuZHJvaWQgdHJlZXMgYW5kIGhhcyBiZWVuIHJlYmFzZWQgb24gLyBjYXJy
aWVkIGluIENocm9tZU9TIHRyZWVzIGZvcgo+ID4gPiA+IHF1aXRlIGEgbG9uZyB0aW1lIGZvciB1
c2Ugb24gYXJtIGFuZCBhcm02NCBib2FyZHMuIEhpc3RvcmljYWxseSBvbgo+ID4gPiA+IHRoZXNl
IGJvYXJkcyB3ZSd2ZSBsZXZlcmFnZWQgbWVjaGFuaXNtIFsyXSB0byBnZXQgaW5mb3JtYXRpb24g
YWJvdXQKPiA+ID4gPiBodW5nIENQVXMsIGJ1dCB3ZSBjb3VsZCBtb3ZlIHRvIFsxXS4KPiA+ID4K
PiA+ID4gT24gdGhlIEFybSBwbGF0Zm9ybXMgaXMgdGhpcyBjb2RlIGFibGUgdG8gbGV2ZXJhZ2Ug
dGhlIGV4aXN0aW5nCj4gPiA+IGluZnJhc3RydWN0dXJlIHRvIGV4dHJhY3Qgc3RhdHVzIGZyb20g
c3R1Y2sgQ1BVczoKPiA+ID4gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvdHJhY2UvY29yZXNpZ2h0
L2NvcmVzaWdodC1jcHUtZGVidWcuaHRtbAo+ID4KPiA+IFl1cCEgSSB3YXNuJ3QgZXhwbGljaXQg
YWJvdXQgdGhpcywgYnV0IHRoYXQncyB3aGVyZSB5b3UgZW5kIHVwIGlmIHlvdQo+ID4gZm9sbG93
IHRoZSB3aG9sZSBidWcgdHJhY2tlciBpdGVtIHRoYXQgd2FzIGxpbmtlZCBhcyBbMl0uCj4gPiBT
cGVjaWZpY2FsbHksIHdlIHVzZWQgdG8gaGF2ZSBkb3duc3RyZWFtIHBhdGNoZXMgaW4gdGhlIENo
cm9tZU9TIHRoYXQKPiA+IGp1c3QgcmVhY2hlZCBpbnRvIHRoZSBjb3Jlc2lnaHQgcmFuZ2UgZnJv
bSBhIFNvQyBzcGVjaWZpYyBkcml2ZXIgYW5kCj4gPiBwcmludGVkIG91dCB0aGUgQ1BVX0RCR1BD
U1IuIFdoZW4gQnJpYW4gd2FzIHVwcmV2dmluZyByazMzOTkKPiA+IENocm9tZWJvb2tzIGhlIGZv
dW5kIHRoYXQgdGhlIGVxdWl2YWxlbnQgZnVuY3Rpb25hbGl0eSBoYWQgbWFkZSBpdAo+ID4gdXBz
dHJlYW0gaW4gYSBnZW5lcmljIHdheSB0aHJvdWdoIHRoZSBjb3Jlc2lnaHQgZnJhbWV3b3JrLiBC
cmlhbgo+ID4gY29uZmlybWVkIGl0IHdhcyB3b3JraW5nIG9uIHJrMzM5OSBhbmQgbWFkZSBhbGwg
b2YgdGhlIGRldmljZSB0cmVlCj4gPiBjaGFuZ2VzIG5lZWRlZCB0byBnZXQgaXQgYWxsIGhvb2tl
ZCB1cCwgc28gKGF0IGxlYXN0IGZvciB0aGF0IFNvQykgaXQKPiA+IHNob3VsZCB3b3JrIG9uIHRo
YXQgU29DLgo+ID4KPiA+IFsyXSBodHRwczovL2lzc3VldHJhY2tlci5nb29nbGUuY29tLzE3MjIx
MzEyOQo+Cj4gSUlSQyB3aXRoIHRoZSBjb3Jlc2lnaHQgQ1BVIGRlYnVnIGRyaXZlciBlbmFibGVk
IGFuZCB0aGUgcHJvcGVyIERUIG5vZGVzCj4gYWRkZWQsIHRoZSBwYW5pYyBoYW5kbGVyIGRvZXMg
ZHVtcCBvdXQgaW5mb3JtYXRpb24gZnJvbSB0aGUgaGFyZHdhcmUuCj4gSSBkb24ndCB0aGluayBp
dCdzIHdpcmVkIHVwIGZvciBodW5nIHRhc2tzIHRob3VnaC4KClllcywgdGhhdCdzIGNvcnJlY3Qu
IFRoZSBjb3Jlc2lnaHQgQ1BVIGRlYnVnIGRyaXZlciBkb2Vzbid0IHdvcmsgZm9yCmh1bmcgdGFz
a3MgYmVjYXVzZSBpdCBjYW4ndCBnZXQgYSByZWFsIHN0YWNrIGNyYXdsLiBBbGwgaXQgY2FuIGdl
dCBpcwp0aGUgUEMgb2YgdGhlIGxhc3QgYnJhbmNoIHRoYXQgdGhlIENQVSB0b29rLiBUaGlzIGlz
IHdoeSBjb21iaW5pbmcKJHtTVUJKRUNUfSBwYXRjaCB3aXRoIHRoZSBhYmlsaXR5IHRvIGdldCBz
dGFjayB0cmFjZXMgdmlhIHBzZXVkby1OTUkKaXMgc3VwZXJpb3IuIFRoYXQgYmVpbmcgc2FpZCwg
ZXZlbiB3aXRoIGp1c3QgdGhlIGNvcmVzaWdodCBDUFUgZGVidWcKZHJpdmVyICR7U1VCSkVDVH0g
cGF0Y2ggaXMgc3RpbGwgaGVscGZ1bCBiZWNhdXNlIChhc3N1bWluZwoiaGFyZGxvY2t1cF9wYW5p
YyIgaXMgc2V0KSB3ZSdsbCBkbyBhIHBhbmljIHdoaWNoIHdpbGwgdGhlbiB0cmlnZ2VyCnRoZSBj
b3Jlc2lnaHQgQ1BVIGRlYnVnIGRyaXZlci4gOi0pCgotRG91ZwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlz
dApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
