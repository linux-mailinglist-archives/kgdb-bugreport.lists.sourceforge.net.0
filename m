Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A3C771E5C
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:41:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxg9-0000Cn-I1
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:41:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSxg8-0000Ch-Oi
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMOb8IYtCmS+E4jNk4oBwORy3lnCiGIs7wIOH4/W3Kw=; b=a8fHohMuSspR7mcts0y0pJqN5v
 QbqZuhp/QHj+istvl8edL8ygVbUd6SBpNeTcqrorcW7D9INJ1sLatXhVSl7Ck5k08f8lEmuvTz/h5
 ViCOkJYDtv4zN7YzHuUszXYoCJl3ublQvXgaYN2NQOYrAtCNVNvI+vLpWVfShavWLwoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FMOb8IYtCmS+E4jNk4oBwORy3lnCiGIs7wIOH4/W3Kw=; b=IfqYEoCDFeEo7uffWKoMOEEXH+
 EGKXYNnvYcNNEY1TxqAohX04nL36JWzl9cN+BRajAm/WDY6/wSY3/n6m7V6Y6qbXIBNWLje9VTR0n
 8UdO+SUlyNOXYzCjZw5e5vaCkAEkWelCHzIUex/ARvIdGUe/4xjsbvtCBckeMH7qvlEM=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSxg8-0006Pm-S6 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:41:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65E681FB;
 Mon,  7 Aug 2023 03:42:14 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 875743F59C;
 Mon,  7 Aug 2023 03:41:27 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:41:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZNDKVP2m-iiZCz3v@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <CAD=FV=V2fFqwg3f3KS29+AkggHFDbyYvfAb12DrDn_PF8+bJjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V2fFqwg3f3KS29+AkggHFDbyYvfAb12DrDn_PF8+bJjA@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Doug, Apologies for the delay. On Mon, Jul 24, 2023 at
   08:55:44AM -0700, Doug Anderson wrote: > On Thu, Jun 1, 2023 at 2:37 PM
   Douglas Anderson <dianders@chromium.org> wrote: > I'm looking for some ideas
    on what to do to move thi [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qSxg8-0006Pm-S6
Subject: Re: [Kgdb-bugreport] [PATCH v9 0/7] arm64: Add debug IPI for
 backtraces / kgdb; try to use NMI for it
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Wei Li <liwei391@huawei.com>, Frederic Weisbecker <frederic@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGkgRG91ZywKCkFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5LgoKT24gTW9uLCBKdWwgMjQsIDIwMjMg
YXQgMDg6NTU6NDRBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3cm90ZToKPiBPbiBUaHUsIEp1biAx
LCAyMDIzIGF0IDI6MzfigK9QTSBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5v
cmc+IHdyb3RlOgo+IEknbSBsb29raW5nIGZvciBzb21lIGlkZWFzIG9uIHdoYXQgdG8gZG8gdG8g
bW92ZSB0aGlzIHBhdGNoIHNlcmllcwo+IGZvcndhcmQuIFRoYW5rcyB0byBEYW5pZWwsIHRoZSBr
Z2RiIHBhdGNoIGlzIG5vdyBpbiBMaW51cydzIHRyZWUgd2hpY2gKPiBob3BlZnVsbHkgbWFrZXMg
dGhpcyBzaW1wbGVyIHRvIGxhbmQuIEkgZ3Vlc3MgdGhlcmUgaXMgc3RpbGwgdGhlCj4gaXJxY2hp
cCBkZXBlbmRlbmN5IHRoYXQgd2lsbCBuZWVkIHRvIGJlIHNvcnRlZCBvdXQsIHRob3VnaC4uLgo+
IAo+IEV2ZW4gaWYgZm9sa3MgYXJlbid0IGluIGFncmVlbWVudCBhYm91dCB3aGV0aGVyIHRoaXMg
aXMgcmVhZHkgdG8gYmUKPiBlbmFibGVkIGluIHByb2R1Y3Rpb24sIEkgZG9uJ3QgdGhpbmsgYW55
dGhpbmcgaGVyZSBpcyBzdXBlcgo+IG9iamVjdGlvbmFibGUgb3IgY29udHJvdmVyc2lhbCwgaXMg
aXQ/IENhbiB3ZSBsYW5kIGl0PyBJZiB5b3UgZmVlbAo+IGxpa2UgaXQgbmVlZHMgZXh0cmEgcmV2
aWV3LCB3b3VsZCBpdCBoZWxwIGlmIEkgdHJpZWQgdG8gZHJ1bSB1cCBzb21lCj4gZXh0cmEgcGVv
cGxlIHRvIHByb3ZpZGUgcmV2aWV3IGZlZWRiYWNrPwoKSWdub3JpbmcgdGhlIHNvdW5kbmVzcyBp
c3N1ZXMgSSBtZW50aW9uZWQgYmVmb3JlICh3aGljaCBJJ20gc2xvd2x5IGNoaXBwaW5nCmF3YXkg
YXQsIGFuZCB5b3UncmUgbGlrZWx5IGx1Y2t5IGVub3VnaCB0byBhdm9pZCBpbiBwcmFjdGljZSku
Li4KCkhhdmluZyBsb29rZWQgb3ZlciB0aGUgc2VyaWVzLCBJIHRoaW5rIHRoZSBHSUN2MyBiaXQg
aXNuJ3QgcXVpdGUgcmlnaHQsIGJ1dCBpcwplYXN5IGVub3VnaCB0byBmaXguIEkndmUgY29tbWVu
dGVkIG9uIHRoZSBwYXRjaCB3aXRoIHdoYXQgSSB0aGluayB3ZSBzaG91bGQKaGF2ZSB0aGVyZS4K
ClRoZSBvbmx5IG1ham9yIHRoaW5nIG90aGVyd2lzZSBmcm9tIG15IFBvViBpcyB0aGUgc3RydWN0
dXJlIG9mIHRoZSBkZWJ1ZyBJUEkKZnJhbWV3b3JrLiBJJ20gbm90IGtlZW4gb24gdGhhdCBiZWlu
ZyBhIHNlcGFyYXRlIGJvZHkgb2YgY29kZSBhbmQgSSB0aGluayBpdApzaG91bGQgbGl2ZSBpbiBz
bXAuYyBhbG9uZyB3aXRoIHRoZSBvdGhlciBJUElzLiBJJ2QgYWxzbyBzdHJvbmdseSBwcmVmZXIg
aWYgd2UKY291bGQgaGF2ZSBzZXBhcmF0ZSBJUElfQ1BVX0JBQ0tUUkFDRSBhbmQgSVBJX0NQVV9L
R0RCIElQSXMsIGFuZCBJIHRoaW5rIHdlIGNhbgpkbyB0aGF0IGVpdGhlciBieSB1bmlmeWluZyBJ
UElfQ1BVX1NUT1AgJiYgSVBJX0NQVV9DUkFTSF9TVE9QIG9yIGJ5IHJlY2xhaW1pbmcKSVBJX1dB
S0VVUCBieSByZXVzaW5nIGEgZGlmZmVyZW50IElQSSBmb3IgdGhlIHBhcmtpbmcgcHJvdG9jb2wg
KGUuZy4KSVBJX1JFU0NIRURVTEUpLgoKSSB0aGluayBpdCdkIGJlIG5pY2UgaWYgdGhlIHNlcmll
cyBjb3VsZCBlbmFibGUgTk1JcyBmb3IgYmFja3RyYWNlIGFuZCB0aGUKQ1BVX3ssQ1JBU0hffVNU
T1AgY2FzZXMsIHdpdGggS0dEQiBiZWluZyB0aGUgYm9udXMgYXRvcC4gVGhhdCB3YXkgaXQnZCBi
ZQpjbGVhcmx5IGJlbmVmaWNpYWwgZm9yIGFueW9uZSB0cnlpbmcgdG8gZGVidWcgbG9ja3VwcyBl
dmVuIGlmIHRoZXkncmUgbm90IGEKS0dEQiB1c2VyLgoKPiBBbHNvOiBpbiBjYXNlIGl0J3MgaW50
ZXJlc3RpbmcgdG8gYW55b25lLCBJJ3ZlIGJlZW4gZG9pbmcgYmVuY2htYXJrcwo+IG9uIHNjNzE4
MC10cm9nZG9yIGRldmljZXMgaW4gcHJlcGFyYXRpb24gZm9yIGVuYWJsaW5nIHRoaXMuIE9uIHRo
YXQKPiBwbGF0Zm9ybSwgSSBkaWQgbWFuYWdlIHRvIHNlZSBhYm91dCA0JSByZWR1Y3Rpb24gaW4g
YSBzZXQgb2YgaGFja2JlbmNoCj4gbnVtYmVycyB3aGVuIGZ1bGx5IGVuYWJsaW5nIHBzZXVkby1O
TUkuIEhvd2V2ZXIsIHdoZW4gSSBpbnN0ZWFkIHJhbgo+IFNwZWVkb21ldGVyIDIuMSBJIHNhdyBu
byBkaWZmZXJlbmNlLiBTZWU6Cj4gCj4gaHR0cHM6Ly9pc3N1ZXRyYWNrZXIuZ29vZ2xlLmNvbS9p
c3N1ZXMvMTk3MDYxOTg3CgpUaGFua3MgZm9yIHRoZSBwb2ludGVyIQoKSSBrbm93IHRoYXQgdGhl
cmUgYXJlIGEgY291cGxlIG9mIHRoaW5ncyB0aGF0IHdlIGNvdWxkIGRvIHRvIHNsaWdodGx5IGlt
cHJvdmUKbG9jYWxfaXJxXyooKSB3aGVuIHVzaW5nIHBOTUlzLCB0aG91Z2ggSSBzdXNwZWN0IHRo
YXQgdGhlIGJ1bGsgb2YgdGhlIGNvc3QKdGhlcmUgd2lsbCBjb21lIGZyb20gdGhlIG5lY2Vzc2Fy
eSBzeW5jaHJvbml6YXRpb24uCgpUaGFua3MsCk1hcmsuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
