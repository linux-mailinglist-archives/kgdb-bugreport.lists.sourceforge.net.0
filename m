Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED786FB46C
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 May 2023 17:53:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pw3Aa-0005ig-PH
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 08 May 2023 15:53:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pw3AY-0005ia-WE
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 15:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7an4MsU+A1D/BiDTLfn7jyyo8mReHeEE9qn6uLYEhzQ=; b=JyziTHVhoVaHM5z1D++354zy99
 wTR0pSnzvmjkWikgYIWdsyO9DAfp003q+WUSDPpd9sLuzqGnYyScv6eREfEDJJGtMgG4grXmPB6GD
 F5BKW3Qar6Wkc+lYY/ZG/s8kiwOU89ByAjwO3HMsAY+K9xH05I5+M+sdNYEEJnMPUOaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7an4MsU+A1D/BiDTLfn7jyyo8mReHeEE9qn6uLYEhzQ=; b=Dktm1+dIddc12qdnXEh/GgAxf2
 RlhQ1sf40mgj+X9Jwv86LKfhhw7KztIALEq+RgeEG8KB53m8LuP+CScGYovz++OkB7EWtrbWRyTxA
 g73PSxkm1GbaoN5DO9nsLy1ldNga8OvI/u7imXGjfWDJ+jsG/Pd5DJflFgC5JmT+Oslk=;
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pw3AY-00006O-Bp for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 15:52:59 +0000
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-3f364b1149eso23553711cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 May 2023 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683561171; x=1686153171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7an4MsU+A1D/BiDTLfn7jyyo8mReHeEE9qn6uLYEhzQ=;
 b=VTCwKxju4UGQK+aOOI55M4FW5lgliYO4qyF5FbXwoCQtw47WN2FW+k0hQdZlF1B+4+
 5/+3CJ30Lau51BWV9FWizt5CQ987cP6V/NX57PJvGkOMS5dXXCwlsM2dfgMZgDGy+L1F
 Sg87s7AhLs8lfJx9o6CubHl1x+GVQpO5FOl8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683561171; x=1686153171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7an4MsU+A1D/BiDTLfn7jyyo8mReHeEE9qn6uLYEhzQ=;
 b=jsIYEM8l3Kh586NKUYpgw/U5IVT3fBe+fLajCJNQ0ZUY7JmN8VZGXM9aR8fZd/zpuI
 fUkZrnmCq1jqcO++M0FwsBOsZa3UpgWLOjFtd12RnQJvHjnlMFIAJe2yDfvJdNc5t4xT
 ahLbw8LRotepdMZAp0QConAO74PDn+wLI7zMjzLw35d6xpbb9Rwkjf+QPtQBt09KL7hY
 t/X7kW1MN/l1kUUc2uFc5rdrZ7pyYInlvvYAGGqs8JxMuN+SE/sBMzkTxD6ZxYHa2LNL
 U++aKk4J4A16TRqzaconGnQeKHIZlk3LgLNK+DQzGT7Rl1JsHS51UEr1zgnjy31tfbMz
 wgTA==
X-Gm-Message-State: AC+VfDzIFIOejb9AShC99y97LgWuiOofRMrZwRzp8jUKdG+jj7yj8UBb
 5b2IAxb66PZohw6le8E6y3j8zsdn4ZsqKHTI5JU=
X-Google-Smtp-Source: ACHHUZ4LhXKVWy4gDQHp+hD2KVekCqPuhibsXE5w+tng8pdFW09hze+7RuIHhgqz+CN9siBcCvxg2Q==
X-Received: by 2002:a05:622a:188f:b0:3f1:fa37:c837 with SMTP id
 v15-20020a05622a188f00b003f1fa37c837mr15411744qtc.64.1683561171625; 
 Mon, 08 May 2023 08:52:51 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 c1-20020ac81e81000000b003e97fe68511sm3098978qtm.3.2023.05.08.08.52.47
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:52:47 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-3f38824a025so248141cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 May 2023 08:52:47 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:3ef:3083:a437 with SMTP id
 w9-20020ac857c9000000b003ef3083a437mr518031qta.18.1683561166909; Mon, 08 May
 2023 08:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
 <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
 <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely>
In-Reply-To: <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 May 2023 08:52:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
Message-ID: <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sun, May 7, 2023 at 6:05 PM Nicholas Piggin <npiggin@gmail.com>
    wrote: > > > No, I wasn't aware of it. Interesting, it seems to basically
    enable > > both types of hardlockup detectors together. I [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.170 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.170 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pw3AY-00006O-Bp
Subject: Re: [Kgdb-bugreport] [PATCH v4 13/17] watchdog/hardlockup: detect
 hard lockups using secondary (buddy) CPUs
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
 Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIE1heSA3LCAyMDIzIGF0IDY6MDXigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPiB3cm90ZToKPgo+ID4gTm8sIEkgd2Fzbid0IGF3YXJlIG9mIGl0LiBJ
bnRlcmVzdGluZywgaXQgc2VlbXMgdG8gYmFzaWNhbGx5IGVuYWJsZQo+ID4gYm90aCB0eXBlcyBv
ZiBoYXJkbG9ja3VwIGRldGVjdG9ycyB0b2dldGhlci4gSWYgdGhhdCByZWFsbHkgY2F0Y2hlcwo+
ID4gbW9yZSBsb2NrdXBzLCBpdCBzZWVtcyBsaWtlIHdlIGNvdWxkIGRvIHRoZSBzYW1lIHRoaW5n
IGZvciB0aGUgYnVkZHkKPiA+IHN5c3RlbS4KPgo+IEl0IGRvZXNuJ3QgY2F0Y2ggbW9yZSBsb2Nr
dXBzLiBPbiBwb3dlcnBjIHdlIGRvbid0IGhhdmUgYSByZWxpYWJsZQo+IHBlcmlvZGljIE5NSSBo
ZW5jZSB0aGUgU01QIGNoZWNrZXIuIEJ1dCBpdCBpcyBwcmVmZXJhYmxlIHRoYXQgYSBDUFUKPiBk
ZXRlY3RzIGl0cyBvd24gbG9ja3VwIGJlY2F1c2UgTk1JIElQSXMgY2FuIHJlc3VsdCBpbiBjcmFz
aGVzIGlmCj4gdGhleSBhcmUgdGFrZW4gaW4gY2VydGFpbiBjcml0aWNhbCBzZWN0aW9ucy4KCkFo
LCBpbnRlcmVzdGluZy4gSXMgdGhlIGZhY3QgdGhhdCBOTUkgSVBJcyBjYW4gY3Jhc2ggdGhlIHN5
c3RlbQpzb21ldGhpbmcgc3BlY2lmaWMgdG8gdGhlIHdheSB0aGV5J3JlIGltcGxlbWVudGVkIGlu
IHBvd2VycGMsIG9yIGlzCnRoaXMgc29tZXRoaW5nIGNvbW1vbiBpbiBMaW51eD8gSSd2ZSBiZWVu
IGFzc3VtaW5nIHRoYXQgSVBJIE5NSXMgd291bGQKYmUgcm91Z2hseSBhcyByZWxpYWJsZSAob3Ig
cGVyaGFwcyBtb3JlIHJlbGlhYmxlKSB0aGFuIHRoZSBOTUkKdGltZXIvcGVyZiBjb3VudGVyLgoK
Cj4gPiA+IEl0J3MgYWxsIHRvCj4gPiA+IGFsbCByYXRoZXIgdGhhbiBidWRkeSB3aGljaCBtYWtl
cyBpdCBtb3JlIGNvbXBsaWNhdGVkIGJ1dCBhcmd1YWJseQo+ID4gPiBiaXQgYmV0dGVyIGZ1bmN0
aW9uYWxpdHkuCj4gPgo+ID4gQ2FuIHlvdSBjb21lIHVwIHdpdGggYW4gZXhhbXBsZSBjcmFzaCB3
aGVyZSB0aGUgImFsbCB0byBhbGwiIHdvdWxkCj4gPiB3b3JrIGJldHRlciB0aGFuIHRoZSBzaW1w
bGUgYnVkZHkgc3lzdGVtIHByb3ZpZGVkIGJ5IHRoaXMgcGF0Y2g/Cj4KPiBDUFUyICAgICAgICAg
ICAgICAgICAgICAgQ1BVMwo+IHNwaW5fbG9ja19pcnFzYXZlKEEpICAgICBzcGluX2xvY2tfaXJx
c2F2ZShCKQo+IHNwaW5fbG9ja19pcnFzYXZlKEIpICAgICBzcGluX2xvY2tfaXJxc2F2ZShBKQo+
Cj4gQ1BVMSB3aWxsIGRldGVjdCB0aGUgbG9ja3VwIG9uIENQVTIsIGJ1dCBDUFUzJ3MgbG9ja3Vw
IHdvbid0IGJlCj4gZGV0ZWN0ZWQgc28gd2UgZG9uJ3QgZ2V0IHRoZSB0cmFjZSB0aGF0IGNhbiBk
aWFnbm9zZSB0aGUgYnVnLgoKQWgsIHRoYXQgbWFrZXMgc2Vuc2UgYXMgYSBiZW5lZml0IGlmCiJz
eXNjdGxfaGFyZGxvY2t1cF9hbGxfY3B1X2JhY2t0cmFjZSIgaXMgZmFsc2UsIHdoaWNoIHlvdSdk
IHByb2JhYmx5CndhbnQgaWYgeW91IGhhZCBtYXNzaXZlbHkgU01QIHN5c3RlbXMuIC4uLm9mIGNv
dXJzZSwgaWYgeW91IGhhZCBhIGxvdApvZiBjb3JlcyB0aGVuIEknZCBpbWFnaW5lIHRoZSAiYWxs
LXRvLWFsbCIgbWlnaHQgYmVjb21lIGEgbG90IG9mCm92ZXJoZWFkLi4uCgpIbW1tLCBidXQgSSBk
b24ndCB0aGluayB5b3UgcmVhbGx5IG5lZWQgImFsbC10by1hbGwiIGNoZWNraW5nIHRvIGdldAp0
aGUgc3RhY2t0cmFjZXMgeW91IHdhbnQsIGRvIHlvdT8gRWFjaCBDUFUgY2FuIGJlICJ3YXRjaGlu
ZyIgZXhhY3RseQpvbmUgb3RoZXIgQ1BVLCBidXQgdGhlbiB3aGVuIHdlIGFjdHVhbGx5IGxvY2sg
dXAgd2UgY291bGQgY2hlY2sgYWxsIG9mCnRoZW0gYW5kIGR1bXAgc3RhY2tzIG9uIGFsbCB0aGUg
b25lcyB0aGF0IGFyZSBsb2NrZWQgdXAuIEkgdGhpbmsgdGhpcwp3b3VsZCBiZSBhIGZhaXJseSBl
YXN5IGltcHJvdmVtZW50IGZvciB0aGUgYnVkZHkgc3lzdGVtLiBJJ2xsIGxlYXZlIGl0Cm91dCBm
b3Igbm93IGp1c3QgdG8ga2VlcCB0aGluZ3Mgc2ltcGxlIGZvciB0aGUgaW5pdGlhbCBsYW5kaW5n
LCBidXQgaXQKd291bGRuJ3QgYmUgaGFyZCB0byBhZGQuIFRoZW4gSSB0aGluayB0aGUgdHdvIFNN
UCBzeXN0ZW1zICAoYnVkZHkgdnMuCmFsbC10by1hbGwpIHdvdWxkIGJlIGVxdWl2YWxlbnQgaW4g
dGVybXMgb2YgZnVuY3Rpb25hbGl0eT8KCgpUaGlua2luZyBhYm91dCB0aGlzIG1vcmUsIEkgZ3Vl
c3MgeW91IG11c3QgYmUgYXNzdW1pbmcgY29vcmRpbmF0aW9uCmJldHdlZW4gdGhlICJTTVAiIGFu
ZCAibm9uLVNNUCIgY2hlY2tlci4gU3BlY2lmaWNhbGx5IEkgZ3Vlc3MgeW91J2QKd2FudCBzb21l
IGd1YXJhbnRlZSB0aGF0IHRoZSAiU01QIiBjaGVja2VyIGFsd2F5cyBmaXJlcyBiZWZvcmUgdGhl
Cm5vbi1TTVAgY2hlY2tlciBiZWNhdXNlIHRoYXQgd291bGQgaGF2ZSBhIGhpZ2hlciBjaGFuY2Ug
b2YgZ2V0dGluZyBhCnN0YWNrIHRyYWNlIHdpdGhvdXQgdGlja2xpbmcgdGhlIElQSSBOTUkgY3Jh
c2guIC4uLmJ1dCB0aGVuIG9uY2UgdGhlCm5vbi1TTVAgY2hlY2tlciBwcmludGVkIGl0cyBvd24g
c3RhY2sgdHJhY2UgeW91J2QgbGlrZSB0aGUgU01QIGNoZWNrZXIKcnVubmluZyBvbiB0aGUgc2Ft
ZSBDUFUgdG8gY2hlY2sgdG8gc2VlIGlmIGFueSBvdGhlciBDUFVzIHdlcmUgbG9ja2VkCnVwIHNv
IHlvdSBjb3VsZCBnZXQgdGhlaXIgc3RhY2tzIGFzIHdlbGwuIFdpdGggbXkgc2ltcGxpc3RpYyBz
b2x1dGlvbgpvZiBqdXN0IGFsbG93aW5nIHRoZSBidWRkeSBkZXRlY3RvciB0byBiZSBlbmFibGVk
IGluIHBhcmFsbGVsIHdpdGggYQpwZXJmLWJhc2VkIGRldGVjdG9yIHRoZW4gd2Ugd291bGRuJ3Qg
aGF2ZSB0aGlzIGxldmVsIG9mIGNvb3JkaW5hdGlvbiwKYnV0IEknbGwgYXNzdW1lIHRoYXQncyBP
SyBmb3IgdGhlIGluaXRpYWwgbGFuZGluZy4KCgo+IEFub3RoZXIgdGhpbmcgSSBhY3R1YWxseSBm
b3VuZCBpdCB1c2VmdWwgZm9yIGlzIHlvdSBjYW4gZWFzaWx5Cj4gc2VlIGlmIGEgY29yZSAoaS5l
LiwgYWxsIHRocmVhZHMgaW4gdGhlIGNvcmUpIG9yIGEgY2hpcCBoYXMKPiBkaWVkLiBNYXliZSBt
b3JlIHVzZWZ1bCB3aGVuIGRvaW5nIHByZXNpbGljb24gYW5kIGJyaW5nIHVwIHdvcmsKPiBvciBm
aXJtd2FyZSBoYWNraW5nLCBidXQgc3RpbGwgdXNlZnVsLgoKSSdtIHByb2JhYmx5IGJpYXNlZCwg
YnV0IGZvciBicmluZ3VwIHdvcmsgYW5kIHN0dWZmIGxpa2UgdGhpcyBJCnVzdWFsbHkgaGF2ZSBr
ZGIva2dkYiBlbmFibGVkIGFuZCB0aGVuIEkgY291bGQgZ2V0IHN0YWNrIHRyYWNlcyBmb3IKd2hp
Y2hldmVyIENQVXMgSSB3YW50LiA6LVAKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
