Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB475FB44
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Jul 2023 17:56:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qNxuu-0008Fj-Tx
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 24 Jul 2023 15:56:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qNxut-0008FV-Et
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Jul 2023 15:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hqJrERUDo+zp/o5kHkQ6aMOqQKKqLEOmzFVk7PKhL/I=; b=QS66rbZdhrDfM5aS+1QjDPksPD
 nMPAbjSB1OhyJDOp90zN7M1zGwCN5wUJ+oJVDNACXp5N8ID8xu6CtBWZY2Nn7ss6e5zXB3/IfsEMN
 11XnhOle0O2/Y9wVhiXRZKht7Temgnlz6NjDW+80x+WHUAnTVHgMht8Y8YeUieu3ikIs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hqJrERUDo+zp/o5kHkQ6aMOqQKKqLEOmzFVk7PKhL/I=; b=EWjjgRkoPbntHrTk3hHrWRQJQT
 AKRYfzRa8dZXVR/xqSLuqpIiS9cLh6Mhyq2SVA7mZJu2iQF+Q0OmHZVhRVKwvbvSoe0w3gT7fTDn7
 O605368DMTIc9lCRkqoMjH2uNbvqPuzV92A2XKNy7KX+GS2iSiK0NByrWh78bucPw3UQ=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNxuo-0002YO-H7 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Jul 2023 15:56:10 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so5960131a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Jul 2023 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690214158; x=1690818958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqJrERUDo+zp/o5kHkQ6aMOqQKKqLEOmzFVk7PKhL/I=;
 b=SrkEWragiyal8ZEiT1/Rd/fxkuDejUOg6Ue7v8n0fy94wSxfTLmbDmd7XVZEplUH+h
 zJCLKe4D/uljzic4FUrF4tfHdAcSJ67uwq/6r5tfiVXwpeOfKZ/xNARMvTfAeCdmicOW
 X40+q98fKabBQxH4JLxUiNEEHbS9TAti/WlkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690214158; x=1690818958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqJrERUDo+zp/o5kHkQ6aMOqQKKqLEOmzFVk7PKhL/I=;
 b=CEMALfCDCuTKFBKxNi6RnCQSGBGz+OUaQ8InOaluV01M/kcsnDiAfq0vvZuv8cN7tQ
 RK+TKhH0LayRmcyvTGWvxi3VgMRphPf9/P138Y4i14x96CgHoCxGdwEnltkkVRWaOy60
 NyqsjHagDNmbUvKSi++4zuIxb/GY0O8wz4xuXfssuznvZ9k0ADEgrVmgtGxV1ufcoI8+
 96Ma4gTvmgLBxEoj23/YvVbWisrfu5O4bTm4CLZtenvfHr/ujlw+AFEfRTsRnMsgEXbF
 tIlQcrMGZqauyvvTn0nUrHvzFJLVnGmUWNjTm+htuaEJr7rPj12UyUsJJeSz1d2gnQYi
 mZJA==
X-Gm-Message-State: ABy/qLYUWyqtPhLLwOjluDhBWSWVFh/JrSDdCJdEVrvO1DCaBxWTs3j5
 FaSd352Bv4JCUSOg6Jwq6WdkyfwuvQdgzlrAXdKrEA==
X-Google-Smtp-Source: APBJJlEQW8NogcELEQmbqv9b3pdp98fdaQVzdUJVuqVIb0RaPC2PO2nKV8oeGXd+jlCbMwOHXM65PQ==
X-Received: by 2002:a05:6402:799:b0:521:8777:b00d with SMTP id
 d25-20020a056402079900b005218777b00dmr7380550edy.15.1690214158254; 
 Mon, 24 Jul 2023 08:55:58 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 k10-20020aa7c04a000000b0050488d1d376sm6427573edo.0.2023.07.24.08.55.57
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 08:55:57 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so16897a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Jul 2023 08:55:57 -0700 (PDT)
X-Received: by 2002:a50:f68e:0:b0:522:3ead:377 with SMTP id
 d14-20020a50f68e000000b005223ead0377mr33590edn.7.1690214156878; Mon, 24 Jul
 2023 08:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213440.2488667-1-dianders@chromium.org>
In-Reply-To: <20230601213440.2488667-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jul 2023 08:55:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2fFqwg3f3KS29+AkggHFDbyYvfAb12DrDn_PF8+bJjA@mail.gmail.com>
Message-ID: <CAD=FV=V2fFqwg3f3KS29+AkggHFDbyYvfAb12DrDn_PF8+bJjA@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi folks, On Thu, Jun 1, 2023 at 2:37 PM Douglas Anderson
    <dianders@chromium.org> wrote: > > This is an attempt to resurrect Sumit's
    old patch series [1] that > allowed us to use the arm64 pseudo-NMI to get
    b [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qNxuo-0002YO-H7
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
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Wei Li <liwei391@huawei.com>,
 Frederic Weisbecker <frederic@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGkgZm9sa3MsCgpPbiBUaHUsIEp1biAxLCAyMDIzIGF0IDI6MzfigK9QTSBEb3VnbGFzIEFuZGVy
c29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBpcyBhbiBhdHRlbXB0
IHRvIHJlc3VycmVjdCBTdW1pdCdzIG9sZCBwYXRjaCBzZXJpZXMgWzFdIHRoYXQKPiBhbGxvd2Vk
IHVzIHRvIHVzZSB0aGUgYXJtNjQgcHNldWRvLU5NSSB0byBnZXQgYmFja3RyYWNlcyBvZiBDUFVz
IGFuZAo+IGFsc28gdG8gcm91bmQgdXAgQ1BVcyBpbiBrZGIva2dkYi4gVGhlIGxhc3QgcG9zdCBm
cm9tIFN1bWl0IHRoYXQgSQo+IGNvdWxkIGZpbmQgd2FzIHY3LCBzbyBJIHN0YXJ0ZWQgbXkgc2Vy
aWVzIGF0IHY4LiBJIGhhdmVuJ3QgY29waWVkIGFsbAo+IG9mIGhpcyBvbGQgY2hhbmdlbG9uZ3Mg
aGVyZSwgYnV0IHlvdSBjYW4gZmluZCB0aGVtIGZyb20gdGhlIGxpbmsuCj4KPiBJJ20gcmVhbGx5
IGxvb2tpbmcgZm9yIGEgd2F5IHRvIGxhbmQgdGhpcyBwYXRjaCBzZXJpZXMuIEluIHJlc3BvbnNl
IHRvCj4gdjgsIE1hcmsgUnV0bGFuZCBpbmRpY2F0ZWQgWzJdIHRoYXQgaGUgd2FzIHdvcnJpZWQg
YWJvdXQgdGhlIHNvdW5kbmVzcwo+IG9mIHBzZXVkbyBOTUkuIFRob3NlIGRlZmluaXRlbHkgbmVl
ZCB0byBnZXQgZml4ZWQsIGJ1dCBJTU8gdGhpcyBwYXRjaAo+IHNlcmllcyBjb3VsZCBzdGlsbCBs
YW5kIGluIHRoZSBtZWFudGltZS4gVGhhdCB3b3VsZCBhdCBsZWFzdCBsZXQKPiBwZW9wbGUgdGVz
dCB3aXRoIGl0Lgo+Cj4gUmVxdWVzdCBmb3IgYW55b25lIHJlYWRpbmcgdGhpczogcGxlYXNlIGhl
bHAgaW5kaWNhdGUgeW91ciBzdXBwb3J0IG9mCj4gdGhpcyBwYXRjaCBzZXJpZXMgbGFuZGluZyBi
eSByZXBseWluZywgZXZlbiBpZiB5b3UgZG9uJ3QgaGF2ZSB0aGUKPiBiYWNrZ3JvdW5kIGZvciBh
IGZ1bGwgcmV2aWV3LiBNeSBzdXNwaWNpb24gaXMgdGhhdCB0aGVyZSBhcmUgYSBsb3Qgb2YKPiBw
ZW9wbGUgd2hvIGFncmVlIHRoYXQgdGhpcyB3b3VsZCBiZSBzdXBlciB1c2VmdWwgdG8gZ2V0IGxh
bmRlZC4KPgo+IFNpbmNlIHY4LCBJIGhhdmUgY2xlYW5lZCB1cCB0aGlzIHBhdGNoIHNlcmllcyBi
eSBpbnRlZ3JhdGluZyB0aGUgMTB0aAo+IHBhdGNoIGZyb20gdjggWzNdIGludG8gdGhlIHdob2xl
IHNlcmllcy4gQXMgcGFydCBvZiB0aGlzLCBJIHJlbmFtZWQKPiB0aGUgIk5NSSBJUEkiIHRvIHRo
ZSAiZGVidWcgSVBJIiBzaW5jZSBpdCBjb3VsZCBub3cgYmUgYmFja2VkIGJ5IGEKPiByZWd1bGFy
IElQSSBpbiB0aGUgY2FzZSB0aGF0IHBzZXVkbyBOTUlzIHdlcmVuJ3QgYXZhaWxhYmxlLiBXaXRo
IHRoZQo+IGZhbGxiYWNrLCB0aGlzIGFsbG93ZWQgbWUgdG8gZHJvcCBzb21lIGV4dHJhIHBhdGNo
ZXMgZnJvbSB0aGUKPiBzZXJpZXMuIFRoaXMgZmVlbHMgKHRvIG1lKSB0byBiZSBwcmV0dHkgY2xl
YW4gYW5kIGhvcGVmdWxseSBvdGhlcnMKPiBhZ3JlZS4gQW55IHBhdGNoIEkgdG91Y2hlZCBzaWdu
aWZpY2FudGx5IEkgcmVtb3ZlZCBNYXNheW9zaGkgYW5kCj4gQ2hlbi1ZdSdzIHRhZ3MgZnJvbS4K
Pgo+IC4uLmFsc28gaW4gdjgsIEkgcmVvcmRlcmQgdGhlIHBhdGNoZXMgYSBiaXQgaW4gYSB3YXkg
dGhhdCBzZWVtZWQgYQo+IGxpdHRsZSBjbGVhbmVyIHRvIG1lLgo+Cj4gU2luY2UgdjcsIEkgaGF2
ZToKPiAqIEFkZHJlc3NlZCB0aGUgc21hbGwgYW1vdW50IG9mIGZlZWRiYWNrIHRoYXQgd2FzIHRo
ZXJlIGZvciB2Ny4KPiAqIFJlYmFzZWQuCj4gKiBBZGRlZCBhIG5ldyBwYXRjaCB0aGF0IHByZXZl
bnRzIHVzIGZyb20gc3BhbW1pbmcgdGhlIGxvZ3Mgd2l0aCBpZGxlCj4gICB0YXNrcy4KPiAqIEFk
ZGVkIGFuIGV4dHJhIHBhdGNoIHRvIGdyYWNlZnVsbHkgZmFsbCBiYWNrIHRvIHJlZ3VsYXIgSVBJ
cyBpZgo+ICAgcHNldWRvLU5NSXMgYXJlbid0IHRoZXJlLgo+Cj4gSXQgY2FuIGJlIG5vdGVkIHRo
YXQgdGhpcyBwYXRjaCBzZXJpZXMgd29ya3MgdmVyeSB3ZWxsIHdpdGggdGhlIHJlY2VudAo+ICJo
YXJkbG9ja3VwIiBwYXRjaGVzIHRoYXQgaGF2ZSBsYW5kZWQgdGhyb3VnaCBBbmRyZXcgTW9ydG9u
J3MgdHJlZSBhbmQKPiBhcmUgY3VycmVudGx5IGluIGxpbnV4bmV4dC4gSXQgd29ya3MgZXNwZWNp
YWxseSB3ZWxsIHdpdGggdGhlICJidWRkeSIKPiBsb2NrdXAgZGV0ZWN0b3IuCj4KPiBbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8xNjA0MzE3NDg3LTE0NTQzLTEt
Z2l0LXNlbmQtZW1haWwtc3VtaXQuZ2FyZ0BsaW5hcm8ub3JnLwo+IFsyXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sL1pGdkdxRCUyRiUyRnBtJTJGbFpiK3BARlZGRjc3UzBRMDVOLmNhbWJy
aWRnZS5hcm0uY29tLwo+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNDE5MTU1
MzQxLnY4LjEwLkljMzY1OTk5N2Q2MjQzMTM5ZDA1MjJmYzNhZmNkZmQ4OGQ3YTVmMDMwQGNoYW5n
ZWlkLwo+Cj4gQ2hhbmdlcyBpbiB2OToKPiAtIEFkZCBhIHdhcm5pbmcgaWYgd2UgZG9uJ3QgaGF2
ZSBlbm91Z2ggSVBJcyBmb3IgdGhlIE5NSSBJUEkKPiAtIEFkZGVkIGNvbW1lbnRzIHRoYXQgd2Ug
bWlnaHQgbm90IGJlIHVzaW5nIE5NSSBhbHdheXMuCj4gLSBBZGRlZCBtaXNzaW5nICJpbmxpbmUi
Cj4gLSBBZGRlZCB0byBjb21taXQgbWVzc2FnZSB0aGF0IHRoaXMgZG9lc24ndCBjYXRjaCBhbGwg
Y2FzZXMuCj4gLSBGb2xkIGluIHY4IHBhdGNoICMxMCAoIkZhbGxiYWNrIHRvIGEgcmVndWxhciBJ
UEkgaWYgTk1JIGlzbid0IGVuYWJsZWQiKQo+IC0gTW92ZWQgaGVhZGVyIGZpbGUgb3V0IG9mICJp
bmNsdWRlIiBzaW5jZSBpdCBkaWRuJ3QgbmVlZCB0byBiZSB0aGVyZS4KPiAtIFJlbW92ZSBhcm02
NF9zdXBwb3J0c19ubWkoKQo+IC0gUmVtb3ZlIGZhbGxiYWNrIGZvciB3aGVuIGRlYnVnIElQSSBp
c24ndCBhdmFpbGFibGUuCj4gLSBSZW5hbWVkICJOTUkgSVBJIiB0byAiZGVidWcgSVBJIiBzaW5j
ZSBpdCBtaWdodCBub3QgYmUgYmFja2VkIGJ5IE5NSS4KPiAtIFVwZGF0ZSBjb21taXQgZGVzY3Jp
cHRpb24KPiAtIGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZSgpIG5vIGxvbmdlciByZXR1
cm5zIGJvb2wKPgo+IENoYW5nZXMgaW4gdjg6Cj4gLSAiUHJvdmlkZSBhIHN0dWIga2dkYl9ubWlj
YWxsYmFjaygpIGlmICFDT05GSUdfS0dEQiIgbmV3IGZvciB2OAo+IC0gIlRhZyB0aGUgYXJtNjQg
aWRsZSBmdW5jdGlvbnMgYXMgX19jcHVpZGxlIiBuZXcgZm9yIHY4Cj4gLSBSZW1vdmVkICIjaWZk
ZWYgQ09ORklHX1NNUCIgc2luY2UgYXJtNjQgaXMgYWx3YXlzIFNNUAo+IC0gZGVidWdfaXBpX3Nl
dHVwKCkgYW5kIGRlYnVnX2lwaV90ZWFyZG93bigpIG5vIGxvbmdlciB0YWtlIGNwdSBwYXJhbQo+
Cj4gRG91Z2xhcyBBbmRlcnNvbiAoMik6Cj4gICBhcm02NDogaWRsZTogVGFnIHRoZSBhcm02NCBp
ZGxlIGZ1bmN0aW9ucyBhcyBfX2NwdWlkbGUKPiAgIGtnZGI6IFByb3ZpZGUgYSBzdHViIGtnZGJf
bm1pY2FsbGJhY2soKSBpZiAhQ09ORklHX0tHREIKPgo+IFN1bWl0IEdhcmcgKDUpOgo+ICAgaXJx
Y2hpcC9naWMtdjM6IEVuYWJsZSBzdXBwb3J0IGZvciBTR0lzIHRvIGFjdCBhcyBOTUlzCj4gICBh
cm02NDogQWRkIGZyYW1ld29yayBmb3IgYSBkZWJ1ZyBJUEkKPiAgIGFybTY0OiBzbXA6IEFzc2ln
biBhbmQgc2V0dXAgdGhlIGRlYnVnIElQSQo+ICAgYXJtNjQ6IGlwaV9kZWJ1ZzogQWRkIHN1cHBv
cnQgZm9yIGJhY2t0cmFjZSB1c2luZyB0aGUgZGVidWcgSVBJCj4gICBhcm02NDoga2dkYjogUm91
bmR1cCBjcHVzIHVzaW5nIHRoZSBkZWJ1ZyBJUEkKPgo+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2lycS5oICB8ICAgMyArCj4gIGFyY2gvYXJtNjQva2VybmVsL01ha2VmaWxlICAgIHwgICAyICst
Cj4gIGFyY2gvYXJtNjQva2VybmVsL2lkbGUuYyAgICAgIHwgICA0ICstCj4gIGFyY2gvYXJtNjQv
a2VybmVsL2lwaV9kZWJ1Zy5jIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgYXJjaC9hcm02NC9rZXJuZWwvaXBpX2RlYnVnLmggfCAgMTMgKysrKysKPiAgYXJjaC9h
cm02NC9rZXJuZWwva2dkYi5jICAgICAgfCAgMTQgKysrKysKPiAgYXJjaC9hcm02NC9rZXJuZWwv
c21wLmMgICAgICAgfCAgMTEgKysrKwo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My5jICB8
ICAyOSArKysrKysrLS0tCj4gIGluY2x1ZGUvbGludXgva2dkYi5oICAgICAgICAgIHwgICAxICsK
PiAgOSBmaWxlcyBjaGFuZ2VkLCAxNjggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpJ
J20gbG9va2luZyBmb3Igc29tZSBpZGVhcyBvbiB3aGF0IHRvIGRvIHRvIG1vdmUgdGhpcyBwYXRj
aCBzZXJpZXMKZm9yd2FyZC4gVGhhbmtzIHRvIERhbmllbCwgdGhlIGtnZGIgcGF0Y2ggaXMgbm93
IGluIExpbnVzJ3MgdHJlZSB3aGljaApob3BlZnVsbHkgbWFrZXMgdGhpcyBzaW1wbGVyIHRvIGxh
bmQuIEkgZ3Vlc3MgdGhlcmUgaXMgc3RpbGwgdGhlCmlycWNoaXAgZGVwZW5kZW5jeSB0aGF0IHdp
bGwgbmVlZCB0byBiZSBzb3J0ZWQgb3V0LCB0aG91Z2guLi4KCkV2ZW4gaWYgZm9sa3MgYXJlbid0
IGluIGFncmVlbWVudCBhYm91dCB3aGV0aGVyIHRoaXMgaXMgcmVhZHkgdG8gYmUKZW5hYmxlZCBp
biBwcm9kdWN0aW9uLCBJIGRvbid0IHRoaW5rIGFueXRoaW5nIGhlcmUgaXMgc3VwZXIKb2JqZWN0
aW9uYWJsZSBvciBjb250cm92ZXJzaWFsLCBpcyBpdD8gQ2FuIHdlIGxhbmQgaXQ/IElmIHlvdSBm
ZWVsCmxpa2UgaXQgbmVlZHMgZXh0cmEgcmV2aWV3LCB3b3VsZCBpdCBoZWxwIGlmIEkgdHJpZWQg
dG8gZHJ1bSB1cCBzb21lCmV4dHJhIHBlb3BsZSB0byBwcm92aWRlIHJldmlldyBmZWVkYmFjaz8K
CkFsc286IGluIGNhc2UgaXQncyBpbnRlcmVzdGluZyB0byBhbnlvbmUsIEkndmUgYmVlbiBkb2lu
ZyBiZW5jaG1hcmtzCm9uIHNjNzE4MC10cm9nZG9yIGRldmljZXMgaW4gcHJlcGFyYXRpb24gZm9y
IGVuYWJsaW5nIHRoaXMuIE9uIHRoYXQKcGxhdGZvcm0sIEkgZGlkIG1hbmFnZSB0byBzZWUgYWJv
dXQgNCUgcmVkdWN0aW9uIGluIGEgc2V0IG9mIGhhY2tiZW5jaApudW1iZXJzIHdoZW4gZnVsbHkg
ZW5hYmxpbmcgcHNldWRvLU5NSS4gSG93ZXZlciwgd2hlbiBJIGluc3RlYWQgcmFuClNwZWVkb21l
dGVyIDIuMSBJIHNhdyBubyBkaWZmZXJlbmNlLiBTZWU6CgpodHRwczovL2lzc3VldHJhY2tlci5n
b29nbGUuY29tL2lzc3Vlcy8xOTcwNjE5ODcKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
