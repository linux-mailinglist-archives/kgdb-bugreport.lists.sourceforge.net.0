Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B96ED198
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Apr 2023 17:42:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pqyKG-00017q-Hs
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 24 Apr 2023 15:42:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pqyK8-00017d-95
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxcjgeLi5mR/+Rnc6mrQlDv9TmBqIx7WXWMzAgilAKE=; b=YSI+G4ukELis+JW5EQPzCtGhV+
 NepkCkunI7LMfHpBbgs29+0ikuuoXzMgwitHu12IlVoJjkYufrDb8a/8+vhU7ebM0czh0gUAvYUim
 bMs3UHRjw/HlpuQJBubXwG1UrSX4AEOUCEXOdY3ztWqeYhAy47oIesOJPh9PeFPe0Sdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hxcjgeLi5mR/+Rnc6mrQlDv9TmBqIx7WXWMzAgilAKE=; b=arsBTPiLj5mtCsk0eogjqVy8K+
 NFKj0MYUmuCytzCEkfTBLU3ikGM7GX6kDBQM56rnQtSRGAm7YH+UeErKbZw9qJP0Nhr5L5nutKVSO
 +hL1PDeXjYVdJG3ChTe83OnWZcVZ4Q4nTezlBYilDfQzG5Fz4VtSu2RhmWzc5vC9GcVs=;
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pqyK5-0007FC-7c for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:41:52 +0000
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-76073fb4511so100352739f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682350903; x=1684942903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxcjgeLi5mR/+Rnc6mrQlDv9TmBqIx7WXWMzAgilAKE=;
 b=SnuD53a6zHv/DCmYSHwbJSQ31GMVB2aiE8Iu3vJBlBExy34TZkw/41Fhav5tatneun
 QI7Far9j0Od9pULjsNw4bj6Hzy6PDPM7MFQGeWWNVTrXxt9bIqlN2EsBufpQTCL5S39X
 Zd7Sgpef4deW2YqO4yMmd5W6gj7J4I75ETOYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350903; x=1684942903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxcjgeLi5mR/+Rnc6mrQlDv9TmBqIx7WXWMzAgilAKE=;
 b=j3qLpS9Im6EpwwQA9YkCJmMBG+awGvl1RV2ZYuGTU9xVGIXDmNYd3Q2DNschfIyAdG
 aK/AXyEf8JfwWmlu33icTSTmyUlThoRST7L+qVzKz2K6Voo7tQ1iZqNK6N8B8sn+aULf
 DSS8ha+e25NszcMV8Ck77nuV6aeezMuGtpIzCMfeYFBpS7uQs0Z6vgltzIkf2Krt/WbG
 FNawu9l9V6IWpj/E1Jp4ROD6fD/mLLml5aLglvy6kkVW2r1iNz7m/MpoQ9uXR4Xao/f7
 a91EdjSh5A0k/JTK4wA5vSVjR1eXT0wBn5ZE/8lZBY0H7FWSYd2z8fjodqe6WZWUCAqU
 zNSQ==
X-Gm-Message-State: AAQBX9erqZHIAhK0zX2+iignFPbbPF43kWzSZf7CTDmhjQwuYmXOlII1
 keNPCWOoYdhLa2T2YSs1b/2bCA/+JWvqOiAYDSM=
X-Google-Smtp-Source: AKy350YF4Vz4thdbunOGRmRE5h0QbW2/ab38LBhED6rMdbZGFKiIaQkw6H/8PkoCI3dclnqfLleA1w==
X-Received: by 2002:a6b:7601:0:b0:760:b591:e651 with SMTP id
 g1-20020a6b7601000000b00760b591e651mr6048915iom.13.1682350902810; 
 Mon, 24 Apr 2023 08:41:42 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056638248e00b0040fadb4f6d8sm3459653jat.81.2023.04.24.08.41.41
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:41:42 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-329577952c5so1061395ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 08:41:41 -0700 (PDT)
X-Received: by 2002:a05:6e02:1606:b0:315:8e3a:f546 with SMTP id
 t6-20020a056e02160600b003158e3af546mr480218ilu.6.1682350901412; Mon, 24 Apr
 2023 08:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <20230424125355.GA4054@aspen.lan>
In-Reply-To: <20230424125355.GA4054@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Apr 2023 08:41:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
Message-ID: <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 24, 2023 at 5:54 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Fri, Apr 21, 2023 at 03:53:30PM -0700, Douglas Anderson wrote:
    > > From: Colin Cross <ccross@android.com> > [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pqyK5-0007FC-7c
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
 Ingo Molnar <mingo@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
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

SGksCgpPbiBNb24sIEFwciAyNCwgMjAyMyBhdCA1OjU04oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAyMSwgMjAy
MyBhdCAwMzo1MzozMFBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gRnJvbTog
Q29saW4gQ3Jvc3MgPGNjcm9zc0BhbmRyb2lkLmNvbT4KPiA+Cj4gPiBJbXBsZW1lbnQgYSBoYXJk
bG9ja3VwIGRldGVjdG9yIHRoYXQgY2FuIGJlIGVuYWJsZWQgb24gU01QIHN5c3RlbXMKPiA+IHRo
YXQgZG9uJ3QgaGF2ZSBhbiBhcmNoIHByb3ZpZGVkIG9uZSBvciBvbmUgaW1wbGVtZW50ZWQgYXRv
cCBwZXJmIGJ5Cj4gPiB1c2luZyBpbnRlcnJ1cHRzIG9uIG90aGVyIGNwdXMuIEVhY2ggY3B1IHdp
bGwgdXNlIGl0cyBzb2Z0bG9ja3VwCj4gPiBocnRpbWVyIHRvIGNoZWNrIHRoYXQgdGhlIG5leHQg
Y3B1IGlzIHByb2Nlc3NpbmcgaHJ0aW1lciBpbnRlcnJ1cHRzIGJ5Cj4gPiB2ZXJpZnlpbmcgdGhh
dCBhIGNvdW50ZXIgaXMgaW5jcmVhc2luZy4KPiA+Cj4gPiBOT1RFOiB1bmxpa2UgdGhlIG90aGVy
IGhhcmQgbG9ja3VwIGRldGVjdG9ycywgdGhlIGJ1ZGR5IG9uZSBjYW4ndAo+ID4gZWFzaWx5IHBy
b3ZpZGUgYSBiYWNrdHJhY2Ugb24gdGhlIENQVSB0aGF0IGxvY2tlZCB1cC4gSXQgcmVsaWVzIG9u
Cj4gPiBzb21lIG90aGVyIG1lY2hhbmlzbSBpbiB0aGUgc3lzdGVtIHRvIGdldCBpbmZvcm1hdGlv
biBhYm91dCB0aGUgbG9ja2VkCj4gPiB1cCBDUFVzLiBUaGlzIGNvdWxkIGJlIHN1cHBvcnQgZm9y
IE5NSSBiYWNrdHJhY2VzIGxpa2UgWzFdLCBpdCBjb3VsZAo+ID4gYmUgYSBtZWNoYW5pc20gZm9y
IHByaW50aW5nIHRoZSBQQyBvZiBsb2NrZWQgQ1BVcyBsaWtlIFsyXSwgb3IgaXQKPiA+IGNvdWxk
IGJlIHNvbWV0aGluZyBlbHNlLgo+ID4KPiA+IFRoaXMgc3R5bGUgb2YgaGFyZGxvY2t1cCBkZXRl
Y3RvciBvcmlnaW5hdGVkIGluIHNvbWUgZG93bnN0cmVhbQo+ID4gQW5kcm9pZCB0cmVlcyBhbmQg
aGFzIGJlZW4gcmViYXNlZCBvbiAvIGNhcnJpZWQgaW4gQ2hyb21lT1MgdHJlZXMgZm9yCj4gPiBx
dWl0ZSBhIGxvbmcgdGltZSBmb3IgdXNlIG9uIGFybSBhbmQgYXJtNjQgYm9hcmRzLiBIaXN0b3Jp
Y2FsbHkgb24KPiA+IHRoZXNlIGJvYXJkcyB3ZSd2ZSBsZXZlcmFnZWQgbWVjaGFuaXNtIFsyXSB0
byBnZXQgaW5mb3JtYXRpb24gYWJvdXQKPiA+IGh1bmcgQ1BVcywgYnV0IHdlIGNvdWxkIG1vdmUg
dG8gWzFdLgo+Cj4gT24gdGhlIEFybSBwbGF0Zm9ybXMgaXMgdGhpcyBjb2RlIGFibGUgdG8gbGV2
ZXJhZ2UgdGhlIGV4aXN0aW5nCj4gaW5mcmFzdHJ1Y3R1cmUgdG8gZXh0cmFjdCBzdGF0dXMgZnJv
bSBzdHVjayBDUFVzOgo+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3RyYWNlL2NvcmVzaWdodC9j
b3Jlc2lnaHQtY3B1LWRlYnVnLmh0bWwKCll1cCEgSSB3YXNuJ3QgZXhwbGljaXQgYWJvdXQgdGhp
cywgYnV0IHRoYXQncyB3aGVyZSB5b3UgZW5kIHVwIGlmIHlvdQpmb2xsb3cgdGhlIHdob2xlIGJ1
ZyB0cmFja2VyIGl0ZW0gdGhhdCB3YXMgbGlua2VkIGFzIFsyXS4KU3BlY2lmaWNhbGx5LCB3ZSB1
c2VkIHRvIGhhdmUgZG93bnN0cmVhbSBwYXRjaGVzIGluIHRoZSBDaHJvbWVPUyB0aGF0Cmp1c3Qg
cmVhY2hlZCBpbnRvIHRoZSBjb3Jlc2lnaHQgcmFuZ2UgZnJvbSBhIFNvQyBzcGVjaWZpYyBkcml2
ZXIgYW5kCnByaW50ZWQgb3V0IHRoZSBDUFVfREJHUENTUi4gV2hlbiBCcmlhbiB3YXMgdXByZXZ2
aW5nIHJrMzM5OQpDaHJvbWVib29rcyBoZSBmb3VuZCB0aGF0IHRoZSBlcXVpdmFsZW50IGZ1bmN0
aW9uYWxpdHkgaGFkIG1hZGUgaXQKdXBzdHJlYW0gaW4gYSBnZW5lcmljIHdheSB0aHJvdWdoIHRo
ZSBjb3Jlc2lnaHQgZnJhbWV3b3JrLiBCcmlhbgpjb25maXJtZWQgaXQgd2FzIHdvcmtpbmcgb24g
cmszMzk5IGFuZCBtYWRlIGFsbCBvZiB0aGUgZGV2aWNlIHRyZWUKY2hhbmdlcyBuZWVkZWQgdG8g
Z2V0IGl0IGFsbCBob29rZWQgdXAsIHNvIChhdCBsZWFzdCBmb3IgdGhhdCBTb0MpIGl0CnNob3Vs
ZCB3b3JrIG9uIHRoYXQgU29DLgoKWzJdIGh0dHBzOi8vaXNzdWV0cmFja2VyLmdvb2dsZS5jb20v
MTcyMjEzMTI5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9r
Z2RiLWJ1Z3JlcG9ydAo=
