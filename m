Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB2C6F4274
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 May 2023 13:16:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ptnzp-00028D-Hp
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 02 May 2023 11:16:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <irogers@google.com>) id 1pq1v7-0006v1-89
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 22 Apr 2023 01:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/iCWeU91/N/hNqkm6X/hoi99NW0IedfoKNdPVAxV6Y=; b=EUJS5fwIqA1gTHQqxa3XV5eTtV
 8m+iqGvbbs1BM6DbEEKCas7L8KNKBxzRT/JpMazaP8+ylPan/D9sQzDRbbNXO8Ydd6DwbOHSE8Ed0
 FHspXFZ3ZUZQQNM7K6m19xLVywJ4xOP+3MX8PCavpIIPD9EJqBIFq/3vInJWttMw2C+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/iCWeU91/N/hNqkm6X/hoi99NW0IedfoKNdPVAxV6Y=; b=JMFE+j2Voqh7WtKu7DfaiYb6rj
 3S5/lwidWP1wJHMkZQUGKAkqvARQO96vUVKx+cy+KaaicTl6cv3MEWhQ8hC1iE4mo4lMNip1O+HdE
 m/ZPz1cWJZbEN/LmT7JSsR21Z3r/tw/6lrp888f/x51aZADjFV8AIIkQKLQXrBvD9W+E=;
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pq1v4-0002cR-V5 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 22 Apr 2023 01:20:09 +0000
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-3e0965f70ecso1274331cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Apr 2023 18:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682126401; x=1684718401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/iCWeU91/N/hNqkm6X/hoi99NW0IedfoKNdPVAxV6Y=;
 b=MBhwnMbsz+9NhQnDN8VZVxfIJ9lVcvUtYURUKSNjEEm2GFbEzoIAhuy3Tl9X4iaPKz
 rQ6LPmvLGncxHkv0mxMzBgA3RyY04i+33j2LKbsberT7pk81zMQKVzqPIDYTf0MaZpqc
 gAovFp/von7xNfkAjgDA2xUy8c368FhPCpjj52qmdmZN2MeRAX3VhdYMInUwEV+Cl9lI
 emMFPyV02XI7AItMVTj+cJSHCNgVk+oJnYDoq7hS3cFhvUdIDk3DsrRjP3vDUW31Zk0t
 lglD6WE/iSVxdsNRaP82y3qGuptZtwR2S/S6FePXyxubYKXNQ3LsMvLwJRVzfxEJYACl
 uluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682126401; x=1684718401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/iCWeU91/N/hNqkm6X/hoi99NW0IedfoKNdPVAxV6Y=;
 b=kIz4TbX+pnA+z9z++Ca5qrVLXFVxrwprfiGjCQoLWL3VcbOf54PxoHCYWKJY3bFTpw
 1gMmECV3WMtXMu7iwMC72hF8MoJyEdaKa+3xOhGp4BZbrVadRYxa3kREJpik9r566QOd
 2FbMmbONlGv24VvpuX8V1lSKaVTlgqq0FusAIgOdMJJSl38j2F5b14OOHv5AuMjAhYOm
 ZRismUOV8DZ380HTUMKS4a8qAJUxpLe2ZJdNGuiYLib6Dp8rX/GEhEzSRLIDqPbR6VDk
 D6eb/ziG6D8iJUvjpIOldb2AEtizZ2eH61ujcADteWXhVjYXVF+6fN/7jUwL0umOALeC
 VjYw==
X-Gm-Message-State: AAQBX9evkSygyzn5XEuQPD6N3BDbwNd6KD8c9GKXxy9iwPeo7aOt1JOU
 OHsm50NgZg5bYMldehooFZv0ZEhKCWoIg/AWWeysiw==
X-Google-Smtp-Source: AKy350ZVlGmktAM9jIpG8WL1NTNySfQv4A9YeAnh/JOh1qlXMWhGGyxfc/andsyBF93XQasFFFNNWBL+PSXZXQB5r8g=
X-Received: by 2002:ac8:5c0c:0:b0:3ef:19fe:230d with SMTP id
 i12-20020ac85c0c000000b003ef19fe230dmr68201qti.17.1682126400789; Fri, 21 Apr
 2023 18:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
In-Reply-To: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
Date: Fri, 21 Apr 2023 18:19:46 -0700
Message-ID: <CAP-5=fUB1e=bJk-w0i8+MEo4sLOZtb_Eb7FMy4u7ky7D2AZm6A@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>, ravi.v.shankar@intel.com, 
 Andi Kleen <ak@linux.intel.com>, ricardo.neri@intel.com, 
 Stephane Eranian <eranian@google.com>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Apr 21, 2023 at 3:54 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > From: Colin Cross <ccross@android.com> > > Implement a hardlockup
    detector that can be enabled on SMP systems > th [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.176 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1pq1v4-0002cR-V5
X-Mailman-Approved-At: Tue, 02 May 2023 11:15:57 +0000
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
From: Ian Rogers via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Ian Rogers <irogers@google.com>
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMzo1NOKAr1BNIERvdWdsYXMgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDb2xpbiBDcm9zcyA8Y2Nyb3NzQGFu
ZHJvaWQuY29tPgo+Cj4gSW1wbGVtZW50IGEgaGFyZGxvY2t1cCBkZXRlY3RvciB0aGF0IGNhbiBi
ZSBlbmFibGVkIG9uIFNNUCBzeXN0ZW1zCj4gdGhhdCBkb24ndCBoYXZlIGFuIGFyY2ggcHJvdmlk
ZWQgb25lIG9yIG9uZSBpbXBsZW1lbnRlZCBhdG9wIHBlcmYgYnkKPiB1c2luZyBpbnRlcnJ1cHRz
IG9uIG90aGVyIGNwdXMuIEVhY2ggY3B1IHdpbGwgdXNlIGl0cyBzb2Z0bG9ja3VwCj4gaHJ0aW1l
ciB0byBjaGVjayB0aGF0IHRoZSBuZXh0IGNwdSBpcyBwcm9jZXNzaW5nIGhydGltZXIgaW50ZXJy
dXB0cyBieQo+IHZlcmlmeWluZyB0aGF0IGEgY291bnRlciBpcyBpbmNyZWFzaW5nLgo+Cj4gTk9U
RTogdW5saWtlIHRoZSBvdGhlciBoYXJkIGxvY2t1cCBkZXRlY3RvcnMsIHRoZSBidWRkeSBvbmUg
Y2FuJ3QKPiBlYXNpbHkgcHJvdmlkZSBhIGJhY2t0cmFjZSBvbiB0aGUgQ1BVIHRoYXQgbG9ja2Vk
IHVwLiBJdCByZWxpZXMgb24KPiBzb21lIG90aGVyIG1lY2hhbmlzbSBpbiB0aGUgc3lzdGVtIHRv
IGdldCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbG9ja2VkCj4gdXAgQ1BVcy4gVGhpcyBjb3VsZCBi
ZSBzdXBwb3J0IGZvciBOTUkgYmFja3RyYWNlcyBsaWtlIFsxXSwgaXQgY291bGQKPiBiZSBhIG1l
Y2hhbmlzbSBmb3IgcHJpbnRpbmcgdGhlIFBDIG9mIGxvY2tlZCBDUFVzIGxpa2UgWzJdLCBvciBp
dAo+IGNvdWxkIGJlIHNvbWV0aGluZyBlbHNlLgo+Cj4gVGhpcyBzdHlsZSBvZiBoYXJkbG9ja3Vw
IGRldGVjdG9yIG9yaWdpbmF0ZWQgaW4gc29tZSBkb3duc3RyZWFtCj4gQW5kcm9pZCB0cmVlcyBh
bmQgaGFzIGJlZW4gcmViYXNlZCBvbiAvIGNhcnJpZWQgaW4gQ2hyb21lT1MgdHJlZXMgZm9yCj4g
cXVpdGUgYSBsb25nIHRpbWUgZm9yIHVzZSBvbiBhcm0gYW5kIGFybTY0IGJvYXJkcy4gSGlzdG9y
aWNhbGx5IG9uCj4gdGhlc2UgYm9hcmRzIHdlJ3ZlIGxldmVyYWdlZCBtZWNoYW5pc20gWzJdIHRv
IGdldCBpbmZvcm1hdGlvbiBhYm91dAo+IGh1bmcgQ1BVcywgYnV0IHdlIGNvdWxkIG1vdmUgdG8g
WzFdLgo+Cj4gTk9URTogdGhlIGJ1ZGR5IHN5c3RlbSBpcyBub3QgcmVhbGx5IHVzZWZ1bCB0byBl
bmFibGUgb24gYW55Cj4gYXJjaGl0ZWN0dXJlcyB0aGF0IGhhdmUgYSBiZXR0ZXIgbWVjaGFuaXNt
LiBPbiBhcm02NCBmb2xrcyBoYXZlIGJlZW4KPiB0cnlpbmcgdG8gZ2V0IGEgYmV0dGVyIG1lY2hh
bmlzbSBmb3IgeWVhcnMgYW5kIHRoZXJlIGhhcyBldmVuIGJlZW4KPiByZWNlbnQgcG9zdHMgb2Yg
cGF0Y2hlcyBhZGRpbmcgc3VwcG9ydCBbM10uIEhvd2V2ZXIsIG5vdGhpbmcgYWJvdXQgdGhlCj4g
YnVkZHkgc3lzdGVtIGlzIHRpZWQgdG8gYXJtNjQgYW5kIHNldmVyYWwgYXJjaHMgKGV2ZW4gYXJt
MzIsIHdoZXJlIGl0Cj4gd2FzIG9yaWdpbmFsbHkgZGV2ZWxvcGVkKSBjb3VsZCBmaW5kIGl0IHVz
ZWZ1bC4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNDE5MjI1NjA0LjIx
MjA0LTEtZGlhbmRlcnNAY2hyb21pdW0ub3JnCj4gWzJdIGh0dHBzOi8vaXNzdWV0cmFja2VyLmdv
b2dsZS5jb20vMTcyMjEzMTI5Cj4gWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFy
bS1rZXJuZWwvMjAyMjA5MDMwOTM0MTUuMTU4NTAtMS1sZWNvcHplci5jaGVuQG1lZGlhdGVrLmNv
bS8KClRoZXJlIGlzIGFub3RoZXIgcHJvcG9zYWwgdG8gdXNlIHRpbWVycyBmb3IgbG9ja3VwIGRl
dGVjdGlvbiBidXQgbm90CnRoZSBidWRkeSBzeXN0ZW06Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyMzA0MTMwMzU4NDQuR0EzMTYyMEByYW5lcmljYS1zdnIuc2MuaW50ZWwuY29tLwpJ
dCdkIGJlIHZlcnkgZ29vZCB0byBmcmVlIHVwIHRoZSBjb3VudGVyIHVzZWQgYnkgdGhlIGN1cnJl
bnQgTk1JIHdhdGNoZG9nLgoKVGhhbmtzLApJYW4KCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gQ3Jv
c3MgPGNjcm9zc0BhbmRyb2lkLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNr
ZSA8bWthQGNocm9taXVtLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxncm9l
Y2tAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFR6dW5nLUJpIFNoaWggPHR6dW5nYmlA
Y2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJz
QGNocm9taXVtLm9yZz4KPiAtLS0KPiBUaGlzIHBhdGNoIGhhcyBiZWVuIHJlYmFzZWQgaW4gQ2hy
b21lT1Mga2VybmVsIHRyZWVzIG1hbnkgdGltZXMsIGFuZAo+IGVhY2ggdGltZSBzb21lb25lIGhh
ZCB0byBkbyB3b3JrIG9uIGl0IHRoZXkgYWRkZWQgdGhlaXIKPiBTaWduZWQtb2ZmLWJ5LiBJJ3Zl
IGluY2x1ZGVkIHRob3NlIGhlcmUuIEkndmUgYWxzbyBsZWZ0IHRoZSBhdXRob3IgYXMKPiBDb2xp
biBDcm9zcyBzaW5jZSB0aGUgY29yZSBjb2RlIGlzIHN0aWxsIGhpcy4KPgo+IEknbGwgYWxzbyBu
b3RlIHRoYXQgdGhlIENDIGxpc3QgaXMgcHJldHR5IGdpYW50LCBidXQgdGhhdCdzIHdoYXQKPiBn
ZXRfbWFpbnRhaW5lcnMgY2FtZSB1cCB3aXRoIChwbHVzIGEgZmV3IG90aGVyIGZvbGtzIEkgdGhv
dWdodCB3b3VsZAo+IGJlIGludGVyZXN0ZWQpLiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgdGhlcmUn
cyBubyB0cnVlIE1BSU5UQUlORVIKPiBsaXN0ZWQgZm9yIHRoZSBleGlzdGluZyB3YXRjaGRvZyBj
b2RlLiBBc3N1bWluZyBwZW9wbGUgZG9uJ3QgaGF0ZQo+IHRoaXMsIG1heWJlIGl0IHdvdWxkIGdv
IHRocm91Z2ggQW5kcmV3IE1vcnRvbidzIHRyZWU/Cj4KPiAgaW5jbHVkZS9saW51eC9ubWkuaCAg
ICAgICAgIHwgIDE4ICsrKystCj4gIGtlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSAr
Cj4gIGtlcm5lbC93YXRjaGRvZy5jICAgICAgICAgICB8ICAyNCArKysrLS0KPiAga2VybmVsL3dh
dGNoZG9nX2J1ZGR5X2NwdS5jIHwgMTQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBsaWIvS2NvbmZpZy5kZWJ1ZyAgICAgICAgICAgfCAgMTkgKysrKy0KPiAgNSBmaWxl
cyBjaGFuZ2VkLCAxOTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBrZXJuZWwvd2F0Y2hkb2dfYnVkZHlfY3B1LmMKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L25taS5oIGIvaW5jbHVkZS9saW51eC9ubWkuaAo+IGluZGV4IDA0OGMwYjlh
YTYyMy4uMzVmNmM1YzIzNzhiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbm1pLmgKPiAr
KysgYi9pbmNsdWRlL2xpbnV4L25taS5oCj4gQEAgLTQ1LDYgKzQ1LDggQEAgZXh0ZXJuIHZvaWQg
dG91Y2hfc29mdGxvY2t1cF93YXRjaGRvZyh2b2lkKTsKPiAgZXh0ZXJuIHZvaWQgdG91Y2hfc29m
dGxvY2t1cF93YXRjaGRvZ19zeW5jKHZvaWQpOwo+ICBleHRlcm4gdm9pZCB0b3VjaF9hbGxfc29m
dGxvY2t1cF93YXRjaGRvZ3Modm9pZCk7Cj4gIGV4dGVybiB1bnNpZ25lZCBpbnQgIHNvZnRsb2Nr
dXBfcGFuaWM7Cj4gK0RFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBsb25nLCBocnRpbWVyX2ludGVy
cnVwdHMpOwo+ICtERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgbG9uZywgaHJ0aW1lcl9pbnRlcnJ1
cHRzX3NhdmVkKTsKPgo+ICBleHRlcm4gaW50IGxvY2t1cF9kZXRlY3Rvcl9vbmxpbmVfY3B1KHVu
c2lnbmVkIGludCBjcHUpOwo+ICBleHRlcm4gaW50IGxvY2t1cF9kZXRlY3Rvcl9vZmZsaW5lX2Nw
dSh1bnNpZ25lZCBpbnQgY3B1KTsKPiBAQCAtODEsMTQgKzgzLDE0IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCByZXNldF9odW5nX3Rhc2tfZGV0ZWN0b3Iodm9pZCkgeyB9Cj4gICNkZWZpbmUgTk1JX1dB
VENIRE9HX0VOQUJMRUQgICAgICAoMSA8PCBOTUlfV0FUQ0hET0dfRU5BQkxFRF9CSVQpCj4gICNk
ZWZpbmUgU09GVF9XQVRDSERPR19FTkFCTEVEICAgICAoMSA8PCBTT0ZUX1dBVENIRE9HX0VOQUJM
RURfQklUKQo+Cj4gLSNpZiBkZWZpbmVkKENPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SKQo+ICsj
aWYgZGVmaW5lZChDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9DT1JFKQo+ICBleHRlcm4gdm9p
ZCBoYXJkbG9ja3VwX2RldGVjdG9yX2Rpc2FibGUodm9pZCk7Cj4gIGV4dGVybiB1bnNpZ25lZCBp
bnQgaGFyZGxvY2t1cF9wYW5pYzsKPiAgI2Vsc2UKPiAgc3RhdGljIGlubGluZSB2b2lkIGhhcmRs
b2NrdXBfZGV0ZWN0b3JfZGlzYWJsZSh2b2lkKSB7fQo+ICAjZW5kaWYKPgo+IC0jaWYgZGVmaW5l
ZChDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cpIHx8IGRlZmluZWQoQ09ORklHX0hBUkRMT0NLVVBf
REVURUNUT1IpCj4gKyNpZiBkZWZpbmVkKENPTkZJR19IQVZFX05NSV9XQVRDSERPRykgfHwgZGVm
aW5lZChDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9DT1JFKQo+ICAjIGRlZmluZSBOTUlfV0FU
Q0hET0dfU1lTQ1RMX1BFUk0gICAgICAwNjQ0Cj4gICNlbHNlCj4gICMgZGVmaW5lIE5NSV9XQVRD
SERPR19TWVNDVExfUEVSTSAgICAgIDA0NDQKPiBAQCAtMTI0LDYgKzEyNiwxNCBAQCB2b2lkIHdh
dGNoZG9nX25taV9kaXNhYmxlKHVuc2lnbmVkIGludCBjcHUpOwo+Cj4gIHZvaWQgbG9ja3VwX2Rl
dGVjdG9yX3JlY29uZmlndXJlKHZvaWQpOwo+Cj4gKyNpZmRlZiBDT05GSUdfSEFSRExPQ0tVUF9E
RVRFQ1RPUl9CVUREWV9DUFUKPiArdm9pZCBidWRkeV9jcHVfdG91Y2hfd2F0Y2hkb2codm9pZCk7
Cj4gK3ZvaWQgd2F0Y2hkb2dfY2hlY2tfaGFyZGxvY2t1cCh2b2lkKTsKPiArI2Vsc2UKPiArc3Rh
dGljIGlubGluZSB2b2lkIGJ1ZGR5X2NwdV90b3VjaF93YXRjaGRvZyh2b2lkKSB7fQo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgd2F0Y2hkb2dfY2hlY2tfaGFyZGxvY2t1cCh2b2lkKSB7fQo+ICsjZW5k
aWYKPiArCj4gIC8qKgo+ICAgKiB0b3VjaF9ubWlfd2F0Y2hkb2cgLSByZXN0YXJ0IE5NSSB3YXRj
aGRvZyB0aW1lb3V0Lgo+ICAgKgo+IEBAIC0xMzQsNiArMTQ0LDcgQEAgdm9pZCBsb2NrdXBfZGV0
ZWN0b3JfcmVjb25maWd1cmUodm9pZCk7Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCB0b3VjaF9ubWlf
d2F0Y2hkb2codm9pZCkKPiAgewo+ICAgICAgICAgYXJjaF90b3VjaF9ubWlfd2F0Y2hkb2coKTsK
PiArICAgICAgIGJ1ZGR5X2NwdV90b3VjaF93YXRjaGRvZygpOwo+ICAgICAgICAgdG91Y2hfc29m
dGxvY2t1cF93YXRjaGRvZygpOwo+ICB9Cj4KPiBAQCAtMTk2LDggKzIwNyw3IEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCB0cmlnZ2VyX3NpbmdsZV9jcHVfYmFja3RyYWNlKGludCBjcHUpCj4gIHU2NCBo
d19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoaW50IHdhdGNoZG9nX3RocmVzaCk7Cj4gICNlbmRpZgo+
Cj4gLSNpZiBkZWZpbmVkKENPTkZJR19IQVJETE9DS1VQX0NIRUNLX1RJTUVTVEFNUCkgJiYgXAo+
IC0gICAgZGVmaW5lZChDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUikKPiArI2lmIGRlZmluZWQo
Q09ORklHX0hBUkRMT0NLVVBfQ0hFQ0tfVElNRVNUQU1QKSAmJiBkZWZpbmVkKENPTkZJR19IQVJE
TE9DS1VQX0RFVEVDVE9SX1BFUkYpCj4gIHZvaWQgd2F0Y2hkb2dfdXBkYXRlX2hydGltZXJfdGhy
ZXNob2xkKHU2NCBwZXJpb2QpOwo+ICAjZWxzZQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgd2F0Y2hk
b2dfdXBkYXRlX2hydGltZXJfdGhyZXNob2xkKHU2NCBwZXJpb2QpIHsgfQo+IGRpZmYgLS1naXQg
YS9rZXJuZWwvTWFrZWZpbGUgYi9rZXJuZWwvTWFrZWZpbGUKPiBpbmRleCAxMGVmMDY4ZjU5OGQu
LmEyMDU0ZjE2ZjlmNCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvTWFrZWZpbGUKPiArKysgYi9rZXJu
ZWwvTWFrZWZpbGUKPiBAQCAtOTEsNiArOTEsNyBAQCBvYmotJChDT05GSUdfRkFJTF9GVU5DVElP
TikgKz0gZmFpbF9mdW5jdGlvbi5vCj4gIG9iai0kKENPTkZJR19LR0RCKSArPSBkZWJ1Zy8KPiAg
b2JqLSQoQ09ORklHX0RFVEVDVF9IVU5HX1RBU0spICs9IGh1bmdfdGFzay5vCj4gIG9iai0kKENP
TkZJR19MT0NLVVBfREVURUNUT1IpICs9IHdhdGNoZG9nLm8KPiArb2JqLSQoQ09ORklHX0hBUkRM
T0NLVVBfREVURUNUT1JfQlVERFlfQ1BVKSArPSB3YXRjaGRvZ19idWRkeV9jcHUubwo+ICBvYmot
JChDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGKSArPSB3YXRjaGRvZ19obGQubwo+ICBv
YmotJChDT05GSUdfU0VDQ09NUCkgKz0gc2VjY29tcC5vCj4gIG9iai0kKENPTkZJR19SRUxBWSkg
Kz0gcmVsYXkubwo+IGRpZmYgLS1naXQgYS9rZXJuZWwvd2F0Y2hkb2cuYyBiL2tlcm5lbC93YXRj
aGRvZy5jCj4gaW5kZXggOGU2MWYyMWU3ZTMzLi4xMTk5MDQzNjg5YWUgMTAwNjQ0Cj4gLS0tIGEv
a2VybmVsL3dhdGNoZG9nLmMKPiArKysgYi9rZXJuZWwvd2F0Y2hkb2cuYwo+IEBAIC0yOSw3ICsy
OSw3IEBACj4KPiAgc3RhdGljIERFRklORV9NVVRFWCh3YXRjaGRvZ19tdXRleCk7Cj4KPiAtI2lm
IGRlZmluZWQoQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1IpIHx8IGRlZmluZWQoQ09ORklHX0hB
VkVfTk1JX1dBVENIRE9HKQo+ICsjaWYgZGVmaW5lZChDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9DT1JFKSB8fCBkZWZpbmVkKENPTkZJR19IQVZFX05NSV9XQVRDSERPRykKPiAgIyBkZWZpbmUg
V0FUQ0hET0dfREVGQVVMVCAgICAgIChTT0ZUX1dBVENIRE9HX0VOQUJMRUQgfCBOTUlfV0FUQ0hE
T0dfRU5BQkxFRCkKPiAgIyBkZWZpbmUgTk1JX1dBVENIRE9HX0RFRkFVTFQgIDEKPiAgI2Vsc2UK
PiBAQCAtNDcsNyArNDcsNyBAQCBzdGF0aWMgaW50IF9fcmVhZF9tb3N0bHkgbm1pX3dhdGNoZG9n
X2F2YWlsYWJsZTsKPiAgc3RydWN0IGNwdW1hc2sgd2F0Y2hkb2dfY3B1bWFzayBfX3JlYWRfbW9z
dGx5Owo+ICB1bnNpZ25lZCBsb25nICp3YXRjaGRvZ19jcHVtYXNrX2JpdHMgPSBjcHVtYXNrX2Jp
dHMoJndhdGNoZG9nX2NwdW1hc2spOwo+Cj4gLSNpZmRlZiBDT05GSUdfSEFSRExPQ0tVUF9ERVRF
Q1RPUgo+ICsjaWZkZWYgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfQ09SRQo+Cj4gICMgaWZk
ZWYgQ09ORklHX1NNUAo+ICBpbnQgX19yZWFkX21vc3RseSBzeXNjdGxfaGFyZGxvY2t1cF9hbGxf
Y3B1X2JhY2t0cmFjZTsKPiBAQCAtODUsNyArODUsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBoYXJk
bG9ja3VwX3BhbmljX3NldHVwKGNoYXIgKnN0cikKPiAgfQo+ICBfX3NldHVwKCJubWlfd2F0Y2hk
b2c9IiwgaGFyZGxvY2t1cF9wYW5pY19zZXR1cCk7Cj4KPiAtI2VuZGlmIC8qIENPTkZJR19IQVJE
TE9DS1VQX0RFVEVDVE9SICovCj4gKyNlbmRpZiAvKiBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9DT1JFICovCj4gKwo+ICsjaWZkZWYgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1IKPgo+ICAv
Kgo+ICAgKiBUaGVzZSBmdW5jdGlvbnMgY2FuIGJlIG92ZXJyaWRkZW4gaWYgYW4gYXJjaGl0ZWN0
dXJlIGltcGxlbWVudHMgaXRzCj4gQEAgLTEwNiw2ICsxMDgsMTMgQEAgdm9pZCBfX3dlYWsgd2F0
Y2hkb2dfbm1pX2Rpc2FibGUodW5zaWduZWQgaW50IGNwdSkKPiAgICAgICAgIGhhcmRsb2NrdXBf
ZGV0ZWN0b3JfcGVyZl9kaXNhYmxlKCk7Cj4gIH0KPgo+ICsjZWxzZQo+ICsKPiAraW50IF9fd2Vh
ayB3YXRjaGRvZ19ubWlfZW5hYmxlKHVuc2lnbmVkIGludCBjcHUpIHsgcmV0dXJuIDA7IH0KPiAr
dm9pZCBfX3dlYWsgd2F0Y2hkb2dfbm1pX2Rpc2FibGUodW5zaWduZWQgaW50IGNwdSkgeyByZXR1
cm47IH0KPiArCj4gKyNlbmRpZiAvKiBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUiAqLwo+ICsK
PiAgLyogUmV0dXJuIDAsIGlmIGEgTk1JIHdhdGNoZG9nIGlzIGF2YWlsYWJsZS4gRXJyb3IgY29k
ZSBvdGhlcndpc2UgKi8KPiAgaW50IF9fd2VhayBfX2luaXQgd2F0Y2hkb2dfbm1pX3Byb2JlKHZv
aWQpCj4gIHsKPiBAQCAtMTc5LDggKzE4OCw4IEBAIHN0YXRpYyBERUZJTkVfUEVSX0NQVSh1bnNp
Z25lZCBsb25nLCB3YXRjaGRvZ190b3VjaF90cyk7Cj4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVSh1
bnNpZ25lZCBsb25nLCB3YXRjaGRvZ19yZXBvcnRfdHMpOwo+ICBzdGF0aWMgREVGSU5FX1BFUl9D
UFUoc3RydWN0IGhydGltZXIsIHdhdGNoZG9nX2hydGltZXIpOwo+ICBzdGF0aWMgREVGSU5FX1BF
Ul9DUFUoYm9vbCwgc29mdGxvY2t1cF90b3VjaF9zeW5jKTsKPiAtc3RhdGljIERFRklORV9QRVJf
Q1BVKHVuc2lnbmVkIGxvbmcsIGhydGltZXJfaW50ZXJydXB0cyk7Cj4gLXN0YXRpYyBERUZJTkVf
UEVSX0NQVSh1bnNpZ25lZCBsb25nLCBocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQpOwo+ICtERUZJ
TkVfUEVSX0NQVSh1bnNpZ25lZCBsb25nLCBocnRpbWVyX2ludGVycnVwdHMpOwo+ICtERUZJTkVf
UEVSX0NQVSh1bnNpZ25lZCBsb25nLCBocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQpOwo+ICBzdGF0
aWMgdW5zaWduZWQgbG9uZyBzb2Z0X2xvY2t1cF9ubWlfd2FybjsKPgo+ICBzdGF0aWMgaW50IF9f
aW5pdCBub3dhdGNoZG9nX3NldHVwKGNoYXIgKnN0cikKPiBAQCAtMzY0LDYgKzM3Myw5IEBAIHN0
YXRpYyBlbnVtIGhydGltZXJfcmVzdGFydCB3YXRjaGRvZ190aW1lcl9mbihzdHJ1Y3QgaHJ0aW1l
ciAqaHJ0aW1lcikKPiAgICAgICAgIC8qIGtpY2sgdGhlIGhhcmRsb2NrdXAgZGV0ZWN0b3IgKi8K
PiAgICAgICAgIHdhdGNoZG9nX2ludGVycnVwdF9jb3VudCgpOwo+Cj4gKyAgICAgICAvKiB0ZXN0
IGZvciBoYXJkbG9ja3VwcyAqLwo+ICsgICAgICAgd2F0Y2hkb2dfY2hlY2tfaGFyZGxvY2t1cCgp
Owo+ICsKPiAgICAgICAgIC8qIGtpY2sgdGhlIHNvZnRsb2NrdXAgZGV0ZWN0b3IgKi8KPiAgICAg
ICAgIGlmIChjb21wbGV0aW9uX2RvbmUodGhpc19jcHVfcHRyKCZzb2Z0bG9ja3VwX2NvbXBsZXRp
b24pKSkgewo+ICAgICAgICAgICAgICAgICByZWluaXRfY29tcGxldGlvbih0aGlzX2NwdV9wdHIo
JnNvZnRsb2NrdXBfY29tcGxldGlvbikpOwo+IEBAIC04MjAsNyArODMyLDcgQEAgc3RhdGljIHN0
cnVjdCBjdGxfdGFibGUgd2F0Y2hkb2dfc3lzY3Rsc1tdID0gewo+ICAgICAgICAgfSwKPiAgI2Vu
ZGlmIC8qIENPTkZJR19TTVAgKi8KPiAgI2VuZGlmCj4gLSNpZmRlZiBDT05GSUdfSEFSRExPQ0tV
UF9ERVRFQ1RPUgo+ICsjaWZkZWYgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfQ09SRQo+ICAg
ICAgICAgewo+ICAgICAgICAgICAgICAgICAucHJvY25hbWUgICAgICAgPSAiaGFyZGxvY2t1cF9w
YW5pYyIsCj4gICAgICAgICAgICAgICAgIC5kYXRhICAgICAgICAgICA9ICZoYXJkbG9ja3VwX3Bh
bmljLAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvd2F0Y2hkb2dfYnVkZHlfY3B1LmMgYi9rZXJuZWwv
d2F0Y2hkb2dfYnVkZHlfY3B1LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uZGI4MTNiMDBlNmVmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2tlcm5lbC93YXRj
aGRvZ19idWRkeV9jcHUuYwo+IEBAIC0wLDAgKzEsMTQxIEBACj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4gKyNpbmNs
dWRlIDxsaW51eC9jcHVtYXNrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L25taS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGVyY3B1LWRlZnMuaD4KPiAr
Cj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVShib29sLCB3YXRjaGRvZ190b3VjaCk7Cj4gK3N0YXRp
YyBERUZJTkVfUEVSX0NQVShib29sLCBoYXJkX3dhdGNoZG9nX3dhcm4pOwo+ICtzdGF0aWMgY3B1
bWFza190IF9fcmVhZF9tb3N0bHkgd2F0Y2hkb2dfY3B1czsKPiArCj4gK3N0YXRpYyB1bnNpZ25l
ZCBsb25nIGhhcmRsb2NrdXBfYWxsY3B1X2R1bXBlZDsKPiArCj4gK2ludCBfX2luaXQgd2F0Y2hk
b2dfbm1pX3Byb2JlKHZvaWQpCj4gK3sKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtu
b3RyYWNlIHZvaWQgYnVkZHlfY3B1X3RvdWNoX3dhdGNoZG9nKHZvaWQpCj4gK3sKPiArICAgICAg
IC8qCj4gKyAgICAgICAgKiBVc2luZyBfX3JhdyBoZXJlIGJlY2F1c2Ugc29tZSBjb2RlIHBhdGhz
IGhhdmUKPiArICAgICAgICAqIHByZWVtcHRpb24gZW5hYmxlZC4gIElmIHByZWVtcHRpb24gaXMg
ZW5hYmxlZAo+ICsgICAgICAgICogdGhlbiBpbnRlcnJ1cHRzIHNob3VsZCBiZSBlbmFibGVkIHRv
bywgaW4gd2hpY2gKPiArICAgICAgICAqIGNhc2Ugd2Ugc2hvdWxkbid0IGhhdmUgdG8gd29ycnkg
YWJvdXQgdGhlIHdhdGNoZG9nCj4gKyAgICAgICAgKiBnb2luZyBvZmYuCj4gKyAgICAgICAgKi8K
PiArICAgICAgIHJhd19jcHVfd3JpdGUod2F0Y2hkb2dfdG91Y2gsIHRydWUpOwo+ICt9Cj4gK0VY
UE9SVF9TWU1CT0xfR1BMKGJ1ZGR5X2NwdV90b3VjaF93YXRjaGRvZyk7Cj4gKwo+ICtzdGF0aWMg
dW5zaWduZWQgaW50IHdhdGNoZG9nX25leHRfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gK3sKPiAr
ICAgICAgIGNwdW1hc2tfdCBjcHVzID0gd2F0Y2hkb2dfY3B1czsKPiArICAgICAgIHVuc2lnbmVk
IGludCBuZXh0X2NwdTsKPiArCj4gKyAgICAgICBuZXh0X2NwdSA9IGNwdW1hc2tfbmV4dChjcHUs
ICZjcHVzKTsKPiArICAgICAgIGlmIChuZXh0X2NwdSA+PSBucl9jcHVfaWRzKQo+ICsgICAgICAg
ICAgICAgICBuZXh0X2NwdSA9IGNwdW1hc2tfZmlyc3QoJmNwdXMpOwo+ICsKPiArICAgICAgIGlm
IChuZXh0X2NwdSA9PSBjcHUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBucl9jcHVfaWRzOwo+
ICsKPiArICAgICAgIHJldHVybiBuZXh0X2NwdTsKPiArfQo+ICsKPiAraW50IHdhdGNoZG9nX25t
aV9lbmFibGUodW5zaWduZWQgaW50IGNwdSkKPiArewo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IFRoZSBuZXcgY3B1IHdpbGwgYmUgbWFya2VkIG9ubGluZSBiZWZvcmUgdGhlIGZpcnN0IGhydGlt
ZXIgaW50ZXJydXB0Cj4gKyAgICAgICAgKiBydW5zIG9uIGl0LiAgSWYgYW5vdGhlciBjcHUgdGVz
dHMgZm9yIGEgaGFyZGxvY2t1cCBvbiB0aGUgbmV3IGNwdQo+ICsgICAgICAgICogYmVmb3JlIGl0
IGhhcyBydW4gaXRzIGZpcnN0IGhydGltZXIsIGl0IHdpbGwgZ2V0IGEgZmFsc2UgcG9zaXRpdmUu
Cj4gKyAgICAgICAgKiBUb3VjaCB0aGUgd2F0Y2hkb2cgb24gdGhlIG5ldyBjcHUgdG8gZGVsYXkg
dGhlIGZpcnN0IGNoZWNrIGZvciBhdAo+ICsgICAgICAgICogbGVhc3QgMyBzYW1wbGluZyBwZXJp
b2RzIHRvIGd1YXJhbnRlZSBvbmUgaHJ0aW1lciBoYXMgcnVuIG9uIHRoZSBuZXcKPiArICAgICAg
ICAqIGNwdS4KPiArICAgICAgICAqLwo+ICsgICAgICAgcGVyX2NwdSh3YXRjaGRvZ190b3VjaCwg
Y3B1KSA9IHRydWU7Cj4gKyAgICAgICAvKiBNYXRjaCB3aXRoIHNtcF9ybWIoKSBpbiB3YXRjaGRv
Z19jaGVja19oYXJkbG9ja3VwKCkgKi8KPiArICAgICAgIHNtcF93bWIoKTsKPiArICAgICAgIGNw
dW1hc2tfc2V0X2NwdShjcHUsICZ3YXRjaGRvZ19jcHVzKTsKPiArICAgICAgIHJldHVybiAwOwo+
ICt9Cj4gKwo+ICt2b2lkIHdhdGNoZG9nX25taV9kaXNhYmxlKHVuc2lnbmVkIGludCBjcHUpCj4g
K3sKPiArICAgICAgIHVuc2lnbmVkIGludCBuZXh0X2NwdSA9IHdhdGNoZG9nX25leHRfY3B1KGNw
dSk7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIE9mZmxpbmluZyB0aGlzIGNwdSB3aWxs
IGNhdXNlIHRoZSBjcHUgYmVmb3JlIHRoaXMgb25lIHRvIHN0YXJ0Cj4gKyAgICAgICAgKiBjaGVj
a2luZyB0aGUgb25lIGFmdGVyIHRoaXMgb25lLiAgSWYgdGhpcyBjcHUganVzdCBmaW5pc2hlZCBj
aGVja2luZwo+ICsgICAgICAgICogdGhlIG5leHQgY3B1IGFuZCB1cGRhdGluZyBocnRpbWVyX2lu
dGVycnVwdHNfc2F2ZWQsIGFuZCB0aGVuIHRoZQo+ICsgICAgICAgICogcHJldmlvdXMgY3B1IGNo
ZWNrcyBpdCB3aXRoaW4gb25lIHNhbXBsZSBwZXJpb2QsIGl0IHdpbGwgdHJpZ2dlciBhCj4gKyAg
ICAgICAgKiBmYWxzZSBwb3NpdGl2ZS4gIFRvdWNoIHRoZSB3YXRjaGRvZyBvbiB0aGUgbmV4dCBj
cHUgdG8gcHJldmVudCBpdC4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKG5leHRfY3B1IDwg
bnJfY3B1X2lkcykKPiArICAgICAgICAgICAgICAgcGVyX2NwdSh3YXRjaGRvZ190b3VjaCwgbmV4
dF9jcHUpID0gdHJ1ZTsKPiArICAgICAgIC8qIE1hdGNoIHdpdGggc21wX3JtYigpIGluIHdhdGNo
ZG9nX2NoZWNrX2hhcmRsb2NrdXAoKSAqLwo+ICsgICAgICAgc21wX3dtYigpOwo+ICsgICAgICAg
Y3B1bWFza19jbGVhcl9jcHUoY3B1LCAmd2F0Y2hkb2dfY3B1cyk7Cj4gK30KPiArCj4gK3N0YXRp
YyBpbnQgaXNfaGFyZGxvY2t1cF9idWRkeV9jcHUodW5zaWduZWQgaW50IGNwdSkKPiArewo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBocmludCA9IHBlcl9jcHUoaHJ0aW1lcl9pbnRlcnJ1cHRzLCBj
cHUpOwo+ICsKPiArICAgICAgIGlmIChwZXJfY3B1KGhydGltZXJfaW50ZXJydXB0c19zYXZlZCwg
Y3B1KSA9PSBocmludCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gKwo+ICsgICAgICAg
cGVyX2NwdShocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQsIGNwdSkgPSBocmludDsKPiArICAgICAg
IHJldHVybiAwOwo+ICt9Cj4gKwo+ICt2b2lkIHdhdGNoZG9nX2NoZWNrX2hhcmRsb2NrdXAodm9p
ZCkKPiArewo+ICsgICAgICAgdW5zaWduZWQgaW50IG5leHRfY3B1Owo+ICsKPiArICAgICAgIC8q
Cj4gKyAgICAgICAgKiBUZXN0IGZvciBoYXJkbG9ja3VwcyBldmVyeSAzIHNhbXBsZXMuICBUaGUg
c2FtcGxlIHBlcmlvZCBpcwo+ICsgICAgICAgICogIHdhdGNoZG9nX3RocmVzaCAqIDIgLyA1LCBz
byAzIHNhbXBsZXMgZ2V0cyB1cyBiYWNrIHRvIHNsaWdodGx5IG92ZXIKPiArICAgICAgICAqICB3
YXRjaGRvZ190aHJlc2ggKG92ZXIgYnkgMjAlKS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYg
KF9fdGhpc19jcHVfcmVhZChocnRpbWVyX2ludGVycnVwdHMpICUgMyAhPSAwKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgLyogY2hlY2sgZm9yIGEgaGFyZGxvY2t1cCBv
biB0aGUgbmV4dCBjcHUgKi8KPiArICAgICAgIG5leHRfY3B1ID0gd2F0Y2hkb2dfbmV4dF9jcHUo
c21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiArICAgICAgIGlmIChuZXh0X2NwdSA+PSBucl9jcHVfaWRz
KQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgLyogTWF0Y2ggd2l0aCBz
bXBfd21iKCkgaW4gd2F0Y2hkb2dfbm1pX2VuYWJsZSgpIC8gd2F0Y2hkb2dfbm1pX2Rpc2FibGUo
KSAqLwo+ICsgICAgICAgc21wX3JtYigpOwo+ICsKPiArICAgICAgIGlmIChwZXJfY3B1KHdhdGNo
ZG9nX3RvdWNoLCBuZXh0X2NwdSkgPT0gdHJ1ZSkgewo+ICsgICAgICAgICAgICAgICBwZXJfY3B1
KHdhdGNoZG9nX3RvdWNoLCBuZXh0X2NwdSkgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgcmV0
dXJuOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmIChpc19oYXJkbG9ja3VwX2J1ZGR5X2Nw
dShuZXh0X2NwdSkpIHsKPiArICAgICAgICAgICAgICAgLyogb25seSB3YXJuIG9uY2UgKi8KPiAr
ICAgICAgICAgICAgICAgaWYgKHBlcl9jcHUoaGFyZF93YXRjaGRvZ193YXJuLCBuZXh0X2NwdSkg
PT0gdHJ1ZSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAg
ICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBQZXJmb3JtIGFsbC1DUFUgZHVtcCBvbmx5
IG9uY2UgdG8gYXZvaWQgbXVsdGlwbGUgaGFyZGxvY2t1cHMKPiArICAgICAgICAgICAgICAgICog
Z2VuZXJhdGluZyBpbnRlcmxlYXZpbmcgdHJhY2VzCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsg
ICAgICAgICAgICAgICBpZiAoc3lzY3RsX2hhcmRsb2NrdXBfYWxsX2NwdV9iYWNrdHJhY2UgJiYK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICF0ZXN0X2FuZF9zZXRfYml0KDAsICZo
YXJkbG9ja3VwX2FsbGNwdV9kdW1wZWQpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHRyaWdn
ZXJfYWxsYnV0c2VsZl9jcHVfYmFja3RyYWNlKCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAo
aGFyZGxvY2t1cF9wYW5pYykKPiArICAgICAgICAgICAgICAgICAgICAgICBwYW5pYygiV2F0Y2hk
b2cgZGV0ZWN0ZWQgaGFyZCBMT0NLVVAgb24gY3B1ICV1IiwgbmV4dF9jcHUpOwo+ICsgICAgICAg
ICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgV0FSTigxLCAiV2F0Y2hkb2cg
ZGV0ZWN0ZWQgaGFyZCBMT0NLVVAgb24gY3B1ICV1IiwgbmV4dF9jcHUpOwo+ICsKPiArICAgICAg
ICAgICAgICAgcGVyX2NwdShoYXJkX3dhdGNoZG9nX3dhcm4sIG5leHRfY3B1KSA9IHRydWU7Cj4g
KyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBwZXJfY3B1KGhhcmRfd2F0Y2hkb2df
d2FybiwgbmV4dF9jcHUpID0gZmFsc2U7Cj4gKyAgICAgICB9Cj4gK30KPiBkaWZmIC0tZ2l0IGEv
bGliL0tjb25maWcuZGVidWcgYi9saWIvS2NvbmZpZy5kZWJ1Zwo+IGluZGV4IDM5ZDFkOTMxNjRi
ZC4uOWViODZiYzlmNWVlIDEwMDY0NAo+IC0tLSBhL2xpYi9LY29uZmlnLmRlYnVnCj4gKysrIGIv
bGliL0tjb25maWcuZGVidWcKPiBAQCAtMTAzNiw2ICsxMDM2LDkgQEAgY29uZmlnIEhBUkRMT0NL
VVBfREVURUNUT1JfUEVSRgo+ICBjb25maWcgSEFSRExPQ0tVUF9DSEVDS19USU1FU1RBTVAKPiAg
ICAgICAgIGJvb2wKPgo+ICtjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RPUl9DT1JFCj4gKyAgICAg
ICBib29sCj4gKwo+ICAjCj4gICMgYXJjaC8gY2FuIGRlZmluZSBIQVZFX0hBUkRMT0NLVVBfREVU
RUNUT1JfQVJDSCB0byBwcm92aWRlIHRoZWlyIG93biBoYXJkCj4gICMgbG9ja3VwIGRldGVjdG9y
IHJhdGhlciB0aGFuIHRoZSBwZXJmIGJhc2VkIGRldGVjdG9yLgo+IEBAIC0xMDQ1LDYgKzEwNDgs
NyBAQCBjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RPUgo+ICAgICAgICAgZGVwZW5kcyBvbiBERUJV
R19LRVJORUwgJiYgIVMzOTAKPiAgICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RF
VEVDVE9SX1BFUkYgfHwgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0gKPiAgICAgICAgIHNl
bGVjdCBMT0NLVVBfREVURUNUT1IKPiArICAgICAgIHNlbGVjdCBIQVJETE9DS1VQX0RFVEVDVE9S
X0NPUkUKPiAgICAgICAgIHNlbGVjdCBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgaWYgSEFWRV9I
QVJETE9DS1VQX0RFVEVDVE9SX1BFUkYKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgU2F5IFkg
aGVyZSB0byBlbmFibGUgdGhlIGtlcm5lbCB0byBhY3QgYXMgYSB3YXRjaGRvZyB0byBkZXRlY3QK
PiBAQCAtMTA1NSw5ICsxMDU5LDIyIEBAIGNvbmZpZyBIQVJETE9DS1VQX0RFVEVDVE9SCj4gICAg
ICAgICAgIGNoYW5jZSB0byBydW4uICBUaGUgY3VycmVudCBzdGFjayB0cmFjZSBpcyBkaXNwbGF5
ZWQgdXBvbiBkZXRlY3Rpb24KPiAgICAgICAgICAgYW5kIHRoZSBzeXN0ZW0gd2lsbCBzdGF5IGxv
Y2tlZCB1cC4KPgo+ICtjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWV9DUFUKPiArICAg
ICAgIGJvb2wgIkJ1ZGR5IENQVSBoYXJkbG9ja3VwIGRldGVjdG9yIgo+ICsgICAgICAgZGVwZW5k
cyBvbiBERUJVR19LRVJORUwgJiYgU01QCj4gKyAgICAgICBkZXBlbmRzIG9uICFIQVJETE9DS1VQ
X0RFVEVDVE9SICYmICFIQVZFX05NSV9XQVRDSERPRwo+ICsgICAgICAgZGVwZW5kcyBvbiAhUzM5
MAo+ICsgICAgICAgc2VsZWN0IEhBUkRMT0NLVVBfREVURUNUT1JfQ09SRQo+ICsgICAgICAgc2Vs
ZWN0IFNPRlRMT0NLVVBfREVURUNUT1IKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgU2F5IFkg
aGVyZSB0byBlbmFibGUgYSBoYXJkbG9ja3VwIGRldGVjdG9yIHdoZXJlIENQVXMgY2hlY2sKPiAr
ICAgICAgICAgZWFjaCBvdGhlciBmb3IgbG9ja3VwLiBFYWNoIGNwdSB1c2VzIGl0cyBzb2Z0bG9j
a3VwIGhydGltZXIKPiArICAgICAgICAgdG8gY2hlY2sgdGhhdCB0aGUgbmV4dCBjcHUgaXMgcHJv
Y2Vzc2luZyBocnRpbWVyIGludGVycnVwdHMgYnkKPiArICAgICAgICAgdmVyaWZ5aW5nIHRoYXQg
YSBjb3VudGVyIGlzIGluY3JlYXNpbmcuCj4gKwo+ICBjb25maWcgQk9PVFBBUkFNX0hBUkRMT0NL
VVBfUEFOSUMKPiAgICAgICAgIGJvb2wgIlBhbmljIChSZWJvb3QpIE9uIEhhcmQgTG9ja3VwcyIK
PiAtICAgICAgIGRlcGVuZHMgb24gSEFSRExPQ0tVUF9ERVRFQ1RPUgo+ICsgICAgICAgZGVwZW5k
cyBvbiBIQVJETE9DS1VQX0RFVEVDVE9SX0NPUkUKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAg
U2F5IFkgaGVyZSB0byBlbmFibGUgdGhlIGtlcm5lbCB0byBwYW5pYyBvbiAiaGFyZCBsb2NrdXBz
IiwKPiAgICAgICAgICAgd2hpY2ggYXJlIGJ1Z3MgdGhhdCBjYXVzZSB0aGUga2VybmVsIHRvIGxv
b3AgaW4ga2VybmVsCj4gLS0KPiAyLjQwLjAuNjM0Lmc0Y2EzZWYzMjExLWdvb2cKPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0
IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
