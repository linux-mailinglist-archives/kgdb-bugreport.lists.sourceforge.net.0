Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8F6FE2AC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 May 2023 18:42:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwmtd-00076q-SW
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 May 2023 16:42:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pwmtc-00076k-KO
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 16:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p4AcAs1XOdI4uJxnLDu55ay7WUOLwtVEGo1buGajIlI=; b=SrTKwExI7ws8xBvH3FByfu0Hqw
 dNI51IELNS3wyhVkRkC7wRRm3tjhx+aKBw4lLs4UIfmbp6uj0Bizt5EdtcAqOFiy2a7fYM+dXtVXn
 BxUbPPn97Yri/QOnJ+Sfd4HB9yYL659rYU3VYp0SfKQ2YsYTy4Xsbr2PrV+fxVwznKFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p4AcAs1XOdI4uJxnLDu55ay7WUOLwtVEGo1buGajIlI=; b=KGSUAImB7yuLGQU7VM+gneXz2z
 Dq3Kc1l9Gu0z2xvbIZ7g8zIqny+zhYBx1mCMR0BQBkIeW8sFlLrs4yNq+uqSvAe+ho+P5fXAu+wQU
 2ZhGDqOIhMideK2W3CWu6i75F/y+AJBNteXlkoCyNH6igq05+qA4gD+4nbHLc1jSR9m8=;
Received: from mail-qv1-f66.google.com ([209.85.219.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pwmta-002O1X-N0 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 16:42:32 +0000
Received: by mail-qv1-f66.google.com with SMTP id
 6a1803df08f44-61b5a653df7so66934456d6.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 10 May 2023 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683736945; x=1686328945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4AcAs1XOdI4uJxnLDu55ay7WUOLwtVEGo1buGajIlI=;
 b=Js6I0W2BepouMCe3iqpHrnyZJ3jExWghEHQLy6iG3HR5VcyCpGlX6jogARGlUsCSZK
 cMIyRQ8D/zoVRJX++ueu0zOYEW1havA1OO+K1F3ATS200Y0ikXhtVQq5jwRkoEBhtELG
 1ya33wWv5YuwJ68ozCLeWAdhfhkYQeLo/TzBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683736945; x=1686328945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4AcAs1XOdI4uJxnLDu55ay7WUOLwtVEGo1buGajIlI=;
 b=dpVa2smXaYEmENzXkg2A+u77i0N4tkGlwTCd9flgz8pU9aPFLNQ/kDV2WFAkAvTE1v
 tB2R8ZuK99LTq3C/VEIrqu3ieuD/Ls/z9ou5DBO4DmIg1KXu9IHCG0rrhpxiETLCDbxa
 n7NVlEKwmRsqoHwRrfFkmj28Ca3+Z7u6+XLdC8OCcimgPuLiqDvnhilQnwzu55RF/ch/
 5iCUDYBiRF2iDd0oCmpGvWd9Y7ZttrqDFGWK2WO17ucxxzFgP1l8+ts7cPUbcG1Tk32Q
 Rx6086ciYE1rw1/TeJNHA0o86l1LWE+etnGy4b2pGZC8OUyxHzYQM5jsWvvUwKq+9EUF
 iVTA==
X-Gm-Message-State: AC+VfDxbWYaT2mgQmsK6zWdzMCZCJ6k+Pm0XlnLiwLwhDGhrIT6Hwwti
 L08n5QtrZzT9iRu8xXwkEJ5KeNEwYxmUQZyN6Bzo4N/7
X-Google-Smtp-Source: ACHHUZ6d6yg585ckh6naXDzWlpIITFpb0DagvkDVD1TB02n3yEuVR1caC9gknTxyMFa+hOq4zUZRFQ==
X-Received: by 2002:ad4:5f8e:0:b0:5e3:c84a:9422 with SMTP id
 jp14-20020ad45f8e000000b005e3c84a9422mr29208000qvb.2.1683736944946; 
 Wed, 10 May 2023 09:42:24 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 x8-20020ac80188000000b003f38ae9e5cesm1516163qtf.33.2023.05.10.09.42.24
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 09:42:24 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-3f38824a025so535591cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 10 May 2023 09:42:24 -0700 (PDT)
X-Received: by 2002:ac8:5792:0:b0:3ee:d8fe:6f5c with SMTP id
 v18-20020ac85792000000b003eed8fe6f5cmr329937qta.1.1683736943923; Wed, 10 May
 2023 09:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
 <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 May 2023 09:42:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
Message-ID: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, May 10, 2023 at 9:30â€¯AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > On Wed, May 10, 2023 at 08:28:17AM -0700, Doug Anderson wrote:
    > > Hi, > > Hi Doug, > > > On Wed, Apr 19, 2023 at 3:57â [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.66 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pwmta-002O1X-N0
Subject: Re: [Kgdb-bugreport] [PATCH v8 00/10] arm64: Add framework to turn
 an IPI as NMI
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Ulf Hansson <ulf.hansson@linaro.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Pierre Gondois <Pierre.Gondois@arm.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>,
 Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ito-yuichi@fujitsu.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCA5OjMw4oCvQU0gTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCAwODoy
ODoxN0FNIC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+ID4gSGksCj4KPiBIaSBEb3VnLAo+
Cj4gPiBPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCAzOjU34oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+ID4gVGhpcyBpcyBhbiBhdHRlbXB0IHRv
IHJlc3VycmVjdCBTdW1pdCdzIG9sZCBwYXRjaCBzZXJpZXMgWzFdIHRoYXQKPiA+ID4gYWxsb3dl
ZCB1cyB0byB1c2UgdGhlIGFybTY0IHBzZXVkby1OTUkgdG8gZ2V0IGJhY2t0cmFjZXMgb2YgQ1BV
cyBhbmQKPiA+ID4gYWxzbyB0byByb3VuZCB1cCBDUFVzIGluIGtkYi9rZ2RiLiBUaGUgbGFzdCBw
b3N0IGZyb20gU3VtaXQgdGhhdCBJCj4gPiA+IGNvdWxkIGZpbmQgd2FzIHY3LCBzbyBJIGNhbGxl
ZCB0aGlzIHNlcmllcyB2OC4gSSBoYXZlbid0IGNvcGllZCBhbGwgb2YKPiA+ID4gaGlzIG9sZCBj
aGFuZ2Vsb25ncyBoZXJlLCBidXQgeW91IGNhbiBmaW5kIHRoZW0gZnJvbSB0aGUgbGluay4KPiA+
ID4KPiA+ID4gU2luY2UgdjcsIEkgaGF2ZToKPiA+ID4gKiBBZGRyZXNzZWQgdGhlIHNtYWxsIGFt
b3VudCBvZiBmZWVkYmFjayB0aGF0IHdhcyB0aGVyZSBmb3IgdjcuCj4gPiA+ICogUmViYXNlZC4K
PiA+ID4gKiBBZGRlZCBhIG5ldyBwYXRjaCB0aGF0IHByZXZlbnRzIHVzIGZyb20gc3BhbW1pbmcg
dGhlIGxvZ3Mgd2l0aCBpZGxlCj4gPiA+ICAgdGFza3MuCj4gPiA+ICogQWRkZWQgYW4gZXh0cmEg
cGF0Y2ggdG8gZ3JhY2VmdWxseSBmYWxsIGJhY2sgdG8gcmVndWxhciBJUElzIGlmCj4gPiA+ICAg
cHNldWRvLU5NSXMgYXJlbid0IHRoZXJlLgo+ID4gPgo+ID4gPiBTaW5jZSB0aGVyZSBhcHBlYXIg
dG8gYmUgYSBmZXcgZGlmZmVyZW50IHBhdGNoZXMgc2VyaWVzIHJlbGF0ZWQgdG8KPiA+ID4gYmVp
bmcgYWJsZSB0byB1c2UgTk1JcyB0byBnZXQgc3RhY2sgdHJhY2VzIG9mIGNyYXNoZWQgc3lzdGVt
cywgbGV0IG1lCj4gPiA+IHRyeSB0byBvcmdhbml6ZSB0aGVtIHRvIHRoZSBiZXN0IG9mIG15IHVu
ZGVyc3RhbmRpbmc6Cj4gPiA+Cj4gPiA+IGEpIFRoaXMgc2VyaWVzLiBPbiBpdHMgb3duLCBhKSB3
aWxsIChhbW9uZyBvdGhlciB0aGluZ3MpIGVuYWJsZSBzdGFjawo+ID4gPiAgICB0cmFjZXMgb2Yg
YWxsIHJ1bm5pbmcgcHJvY2Vzc2VzIHdpdGggdGhlIHNvZnQgbG9ja3VwIGRldGVjdG9yIGlmCj4g
PiA+ICAgIHlvdSd2ZSBlbmFibGVkIHRoZSBzeXNjdGwgImtlcm5lbC5zb2Z0bG9ja3VwX2FsbF9j
cHVfYmFja3RyYWNlIi4gT24KPiA+ID4gICAgaXRzIG93biwgYSkgZG9lc24ndCBnaXZlIGEgaGFy
ZCBsb2NrdXAgZGV0ZWN0b3IuCj4gPiA+Cj4gPiA+IGIpIEEgZGlmZmVyZW50IHJlY2VudGx5LXBv
c3RlZCBzZXJpZXMgWzJdIHRoYXQgYWRkcyBhIGhhcmQgbG9ja3VwCj4gPiA+ICAgIGRldGVjdG9y
IGJhc2VkIG9uIHBlcmYuIE9uIGl0cyBvd24sIGIpIGdpdmVzIGEgc3RhY2sgY3Jhd2wgb2YgdGhl
Cj4gPiA+ICAgIGxvY2tlZCB1cCBDUFUgYnV0IG5vIHN0YWNrIGNyYXdscyBvZiBvdGhlciBDUFVz
IChldmVuIGlmIHRoZXkncmUKPiA+ID4gICAgbG9ja2VkIHRvbykuIFRvZ2V0aGVyIHdpdGggYSkg
KyBiKSB3ZSBnZXQgZXZlcnl0aGluZyAoZnVsbCBsb2NrdXAKPiA+ID4gICAgZGV0ZWN0LCBmdWxs
IGFiaWxpdHkgdG8gZ2V0IHN0YWNrIGNyYXdscykuCj4gPiA+Cj4gPiA+IGMpIFRoZSBvbGQgQW5k
cm9pZCAiYnVkZHkiIGhhcmQgbG9ja3VwIGRldGVjdG9yIFszXSB0aGF0IEknbQo+ID4gPiAgICBj
b25zaWRlcmluZyB0cnlpbmcgdG8gdXBzdHJlYW0uIElmIGIpIGxhbmRzIHRoZW4gSSBiZWxpZXZl
IGMpIHdvdWxkCj4gPiA+ICAgIGJlIHJlZHVuZGFudCAoYXQgbGVhc3QgZm9yIGFybTY0KS4gYykg
b24gaXRzIG93biBpcyByZWFsbHkgb25seQo+ID4gPiAgICB1c2VmdWwgb24gYXJtNjQgZm9yIHBs
YXRmb3JtcyB0aGF0IGNhbiBwcmludCBDUFVfREJHUENTUiBzb21laG93Cj4gPiA+ICAgIChzZWUg
WzRdKS4gYSkgKyBjKSBpcyByb3VnaGx5IGFzIGdvb2QgYXMgYSkgKyBiKS4KPgo+ID4gSXQncyBi
ZWVuIDMgd2Vla3MgYW5kIEkgaGF2ZW4ndCBoZWFyZCBhIHBlZXAgb24gdGhpcyBzZXJpZXMuIFRo
YXQKPiA+IG1lYW5zIG5vYm9keSBoYXMgYW55IG9iamVjdGlvbnMgYW5kIGl0J3MgYWxsIGdvb2Qg
dG8gbGFuZCwgcmlnaHQ/Cj4gPiBSaWdodD8gOi1QCj4KPiBGV0lXLCB0aGVyZSBhcmUgc3RpbGwg
bG9uZ3N0YW5kaW5nIHNvdW5kbmVzcyBpc3N1ZXMgaW4gdGhlIGFybTY0IHBzZXVkby1OTUkKPiBz
dXBwb3J0IChhbmQgZml4aW5nIHRoYXQgcmVxdWlyZXMgYW4gb3ZlcmhhdWwgb2Ygb3VyIERBSUYg
LyBJUlEgZmxhZwo+IG1hbmFnZW1lbnQsIHdoaWNoIEkndmUgYmVlbiBjaGlwcGluZyBhd2F5IGF0
IGZvciBhIG51bWJlciBvZiByZWxlYXNlcyksIHNvIEkKPiBoYWRuJ3QgbG9va2VkIGF0IHRoaXMg
aW4gZGV0YWlsIHlldCBiZWNhdXNlIHRoZSBmb3VuZGF0aW9ucyBhcmUgc3RpbGwgc29tZXdoYXQK
PiBkb2RneS4KPgo+IEkgYXBwcmVjaWF0ZSB0aGF0IHRoaXMgaGFzIGJlZW4gYXJvdW5kIGZvciBh
IHdoaWxlLCBhbmQgaXQncyBvbiBteSBxdWV1ZSB0bwo+IGxvb2sgYXQuCgpBaCwgdGhhbmtzIGZv
ciB0aGUgaGVhZHMgdXAhIFdlJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgdHVybmluZyB0aGlzIG9u
CmluIHByb2R1Y3Rpb24gaW4gQ2hyb21lT1MgYmVjYXVzZSBpdCB3aWxsIGhlbHAgdXMgdHJhY2sg
ZG93biBhIHdob2xlCmNsYXNzIG9mIGZpZWxkLWdlbmVyYXRlZCBjcmFzaCByZXBvcnRzIHRoYXQg
YXJlIG90aGVyd2lzZSBvcGFxdWUgdG8KdXMuIEl0IHNvdW5kcyBhcyBpZiBtYXliZSB0aGF0J3Mg
bm90IGEgZ29vZCBpZGVhIHF1aXRlIHlldD8gRG8geW91CmhhdmUgYW55IGlkZWEgb2YgaG93IG11
Y2ggZmFydGhlciBhbG9uZyB0aGlzIG5lZWRzIHRvIGdvPyAuLi5vZgpjb3Vyc2UsIHdlJ3ZlIGFs
c28gcnVuIGludG8gaXNzdWVzIHdpdGggTWVkaWF0ZWsgZGV2aWNlcyBiZWNhdXNlIHRoZXkKZG9u
J3Qgc2F2ZS9yZXN0b3JlIEdJQ1IgcmVnaXN0ZXJzIHByb3Blcmx5IFsxXS4gSW4gdGhlb3J5LCB3
ZSBtaWdodCBiZQphYmxlIHRvIHdvcmsgYXJvdW5kIHRoYXQgaW4gdGhlIGtlcm5lbC4KCkluIGFu
eSBjYXNlLCBldmVuIGlmIHRoZXJlIGFyZSBidWdzIHRoYXQgd291bGQgcHJldmVudCB0dXJuaW5n
IHRoaXMgb24KZm9yIHByb2R1Y3Rpb24sIGl0IHN0aWxsIHNlZW1zIGxpa2Ugd2UgY291bGQgc3Rp
bGwgbGFuZCB0aGlzIHNlcmllcy4KSXQgc2ltcGx5IHdvdWxkbid0IGRvIGFueXRoaW5nIHVudGls
IHNvbWVvbmUgdHVybmVkIG9uIHBzZXVkbyBOTUlzLAp3aGljaCB3b3VsZG4ndCBoYXBwZW4gdGls
bCB0aGUga2lua3MgYXJlIHdvcmtlZCBvdXQuCgouLi5hY3R1YWxseSwgSSBndWVzcyBJIHNob3Vs
ZCBzYXkgdGhhdCBpZiBhbGwgdGhlIHBhdGNoZXMgb2YgdGhlCmN1cnJlbnQgc2VyaWVzIGRvIGxh
bmQgdGhlbiBpdCBhY3R1YWxseSBfd291bGRfIHN0aWxsIGRvIHNvbWV0aGluZywKZXZlbiB3aXRo
b3V0IHBzZXVkby1OTUkuIEFzc3VtaW5nIHRoZSBsYXN0IHBhdGNoIGxvb2tzIE9LLCBpdCB3b3Vs
ZCBhdApsZWFzdCBzdGFydCBmYWxsaW5nIGJhY2sgdG8gdXNpbmcgcmVndWxhciBJUElzIHRvIGRv
IGJhY2t0cmFjZXMuIFRoYXQKd291bGRuJ3QgZ2V0IGJhY2t0cmFjZXMgb24gaGFyZCBsb2NrZWQg
dXAgQ1BVcyBidXQgaXQgd291bGQgYmUgYmV0dGVyCnRoYW4gd2hhdCB3ZSBoYXZlIHRvZGF5IHdo
ZXJlIHdlIGRvbid0IGdldCBhbnkgYmFja3RyYWNlcy4gVGhpcyB3b3VsZApnZXQgYXJtNjQgb24g
cGFyIHdpdGggYXJtMzIuLi4KClsxXSBodHRwczovL2lzc3VldHJhY2tlci5nb29nbGUuY29tLzI4
MTgzMTI4OAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dk
Yi1idWdyZXBvcnQK
