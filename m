Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230B6F7921
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:29:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhRr-0004t5-GR
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:29:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhRn-0004sz-Vi
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CzswV8h6Pv5RbnDUfs5XaziOPH7Dg5YP+9HIzH76G84=; b=VE15vxB6bhC25yGFiTwleIRVZM
 Oxn1eofdzTlkX1WBqsbgROQUWRFFdGO64/7B4hQMwdUHH3ZJ/51xiEwX7vSwWWcgzzCdIfXYnFiVi
 8jF6DpcjLCXprhK4PFopkm02wb9I0A6W+yEmGnlPuAz6KDAxDkPm1hNHQk3CoKvBiUJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CzswV8h6Pv5RbnDUfs5XaziOPH7Dg5YP+9HIzH76G84=; b=PyuI7tTv8t+RbWbS3ba4IfbuUS
 HLjkxw71fFpn3/du3F0aDS3ThrjQo2c320gAlmitwq2wv5b0ibzB7wLiNudCFhv/rGhad86NNkwNv
 CWyOmel+FTUEGQs5Y/u0JiUafc6IYIATMhn6AuVx1LJgVSC2VBFRWzLpiSZh3ivuPWkA=;
Received: from mail-oa1-f54.google.com ([209.85.160.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhRn-00067u-2r for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:29:12 +0000
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-18ef8e9aa00so948062fac.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683239345; x=1685831345;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CzswV8h6Pv5RbnDUfs5XaziOPH7Dg5YP+9HIzH76G84=;
 b=BM7M1nolVm4liyJ0lwrOnP8uEdQo4Bh3RIBpfADNuY/b+IBP6Iovek/3wvlurr/I2b
 h3WAMIH+1obyaZrBgJKwPFGHZ50DAEJJRAuI9VVvGdfQ1XeaAvzb416F5WZi7F+Oj5RP
 d+AQxZtvBiqzC2FsBilo7F59tWZ9ViHM3nzcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683239345; x=1685831345;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CzswV8h6Pv5RbnDUfs5XaziOPH7Dg5YP+9HIzH76G84=;
 b=adQeeB7+OIoS42YY2E9f6X9H4QRG5EQI/mpCR8UxatCBFz5ZIKMoIfxA4/0sKYVHVu
 4QNnz6lHpXPtEn7VQSJUZbSU3Lf/A+1Xtb6xWyAZ45Apa5OZleWaV/lBFLVVjBpPB0hx
 83ovn7v4hWle+2sg2LlyN3qPXMMRtBS4NzStsQG8PmrhasS+IeKPVFsNEB9m2og3wElT
 FQdQ8gvIPm3drfbRRv0fhMZADE5C/943y6LlaDxfrRtcbV3+RttgUmNbFuP9OyjGJxEh
 KkT63S3OdHXiK/0nbbG+2giOFCS+GYbn+2dairTw+3JbrL6aCXZeSnbcX0aN9uS6RsG7
 Q/Fw==
X-Gm-Message-State: AC+VfDxoJTMPp+n/hmd+2JJEVLYiM48B+yQ/vlMGyepC3lvYb9bg4+t4
 bBtfXFyMqSI98v9RFUkQbOcyK6a2Dj47eD/nPC4=
X-Google-Smtp-Source: ACHHUZ6mPDZjM//4RlXp/8ZyZRzqkjcoGUVLQbfwL3Kw8RZoDW4pcUgLUVr6OMrAg2Aj7dC7DtAJ5w==
X-Received: by 2002:a05:6a00:1990:b0:637:c959:8ea1 with SMTP id
 d16-20020a056a00199000b00637c9598ea1mr4817877pfl.22.1683238949766; 
 Thu, 04 May 2023 15:22:29 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181]) by smtp.gmail.com with ESMTPSA id
 s21-20020aa78295000000b00640defda6d2sm135492pfm.207.2023.05.04.15.22.29
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 15:22:29 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1aaf702c3ccso491105ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:22:29 -0700 (PDT)
X-Received: by 2002:a05:622a:144d:b0:3de:1aaa:42f5 with SMTP id
 v13-20020a05622a144d00b003de1aaa42f5mr10116qtx.15.1683238596262; Thu, 04 May
 2023 15:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <ZFEqynvf5nqkzEvQ@alley>
In-Reply-To: <ZFEqynvf5nqkzEvQ@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 May 2023 15:16:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1nqunM83LzSXnYiODC66tn5hjSWsUvxabf6vSO7reUQ@mail.gmail.com>
Message-ID: <CAD=FV=V1nqunM83LzSXnYiODC66tn5hjSWsUvxabf6vSO7reUQ@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, May 2, 2023 at 8:23 AM Petr Mladek <pmladek@suse.com>
    wrote: > > On Mon 2023-05-01 08:24:46, Douglas Anderson wrote: > > From:
   Colin Cross <ccross@android.com> > > > > Implement a hardlockup [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.54 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhRn-00067u-2r
Subject: Re: [Kgdb-bugreport] cpu hotplug : was: Re: [PATCH v3] hardlockup:
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

SGksCgpPbiBUdWUsIE1heSAyLCAyMDIzIGF0IDg6MjPigK9BTSBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24gMjAyMy0wNS0wMSAwODoyNDo0NiwgRG91Z2xh
cyBBbmRlcnNvbiB3cm90ZToKPiA+IEZyb206IENvbGluIENyb3NzIDxjY3Jvc3NAYW5kcm9pZC5j
b20+Cj4gPgo+ID4gSW1wbGVtZW50IGEgaGFyZGxvY2t1cCBkZXRlY3RvciB0aGF0IGRvZXNuJ3Qg
ZG9lc24ndCBuZWVkIGFueSBleHRyYQo+ID4gYXJjaC1zcGVjaWZpYyBzdXBwb3J0IGNvZGUgdG8g
ZGV0ZWN0IGxvY2t1cHMuIEluc3RlYWQgb2YgdXNpbmcKPiA+IHNvbWV0aGluZyBhcmNoLXNwZWNp
ZmljIHdlIHdpbGwgdXNlIHRoZSBidWRkeSBzeXN0ZW0sIHdoZXJlIGVhY2ggQ1BVCj4gPiB3YXRj
aGVzIG91dCBmb3IgYW5vdGhlciBvbmUuIFNwZWNpZmljYWxseSwgZWFjaCBDUFUgd2lsbCB1c2Ug
aXRzCj4gPiBzb2Z0bG9ja3VwIGhydGltZXIgdG8gY2hlY2sgdGhhdCB0aGUgbmV4dCBDUFUgaXMg
cHJvY2Vzc2luZyBocnRpbWVyCj4gPiBpbnRlcnJ1cHRzIGJ5IHZlcmlmeWluZyB0aGF0IGEgY291
bnRlciBpcyBpbmNyZWFzaW5nLgo+ID4KPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2tlcm5l
bC93YXRjaGRvZ19idWRkeV9jcHUuYwo+ID4gK2ludCB3YXRjaGRvZ19ubWlfZW5hYmxlKHVuc2ln
bmVkIGludCBjcHUpCj4gPiArewo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIFRoZSBuZXcgQ1BV
IHdpbGwgYmUgbWFya2VkIG9ubGluZSBiZWZvcmUgdGhlIGZpcnN0IGhydGltZXIgaW50ZXJydXB0
Cj4gPiArICAgICAgKiBydW5zIG9uIGl0Lgo+Cj4gSXQgZG9lcyBub3QgbmVlZCB0byBiZSB0aGUg
Zmlyc3QgaHJ0aW1lciBpbnRlcnJ1cHQuIFRoZSBDUFUgbWlnaHQgaGF2ZQo+IGJlZW4gb2ZmbGlu
ZWQvb25saW5lZCByZXBlYXRlZGx5LiBUaGUgY291bnRlciBtaWdodCBoYXZlIGFueSB2YWx1ZS4K
Pgo+ID4gKyAgICAgICogSWYgYW5vdGhlciBDUFUgdGVzdHMgZm9yIGEgaGFyZGxvY2t1cCBvbiB0
aGUgbmV3IENQVQo+ID4gKyAgICAgICogYmVmb3JlIGl0IGhhcyBydW4gaXRzIGZpcnN0IGhydGlt
ZXIsIGl0IHdpbGwgZ2V0IGEgZmFsc2UgcG9zaXRpdmUuCj4gPiArICAgICAgKiBUb3VjaCB0aGUg
d2F0Y2hkb2cgb24gdGhlIG5ldyBDUFUgdG8gZGVsYXkgdGhlIGZpcnN0IGNoZWNrIGZvciBhdAo+
ID4gKyAgICAgICogbGVhc3QgMyBzYW1wbGluZyBwZXJpb2RzIHRvIGd1YXJhbnRlZSBvbmUgaHJ0
aW1lciBoYXMgcnVuIG9uIHRoZSBuZXcKPiA+ICsgICAgICAqIENQVS4KPiA+ICsgICAgICAqLwoK
T0ssIEkndmUgdXBkYXRlZCB0aGUgYWJvdmUgY29tbWVudCB0bzoKCi8qCiAqIFRoZSBuZXcgQ1BV
IHdpbGwgYmUgbWFya2VkIG9ubGluZSBiZWZvcmUgdGhlIGhydGltZXIgaW50ZXJydXB0CiAqIGdl
dHMgYSBjaGFuY2UgdG8gcnVuIG9uIGl0LiBJZiBhbm90aGVyIENQVSB0ZXN0cyBmb3IgYQogKiBo
YXJkbG9ja3VwIG9uIHRoZSBuZXcgQ1BVIGJlZm9yZSBpdCBoYXMgcnVuIGl0cyB0aGUgaHJ0aW1l
cgogKiBpbnRlcnJ1cHQsIGl0IHdpbGwgZ2V0IGEgZmFsc2UgcG9zaXRpdmUuIFRvdWNoIHRoZSB3
YXRjaGRvZyBvbgogKiB0aGUgbmV3IENQVSB0byBkZWxheSB0aGUgY2hlY2sgZm9yIGF0IGxlYXN0
IDMgc2FtcGxpbmcgcGVyaW9kcwogKiB0byBndWFyYW50ZWUgb25lIGhydGltZXIgaGFzIHJ1biBv
biB0aGUgbmV3IENQVS4KICovCgo+ID4gKyAgICAgcGVyX2NwdSh3YXRjaGRvZ190b3VjaCwgY3B1
KSA9IHRydWU7Cj4KPiBXZSBzaG91bGQgdG91Y2ggYWxzbyB0aGUgbmV4dF9jcHU6Cj4KPiAgICAg
ICAgIC8qCj4gICAgICAgICAgKiBXZSBhcmUgZ29pbmcgdG8gY2hlY2sgdGhlIG5leHQgQ1BVLiBP
dXIgd2F0Y2hkb2dfaHJ0aW1lcgo+ICAgICAgICAgICogbmVlZCBub3QgYmUgemVybyBpZiB0aGUg
Q1BVIGhhcyBhbHJlYWR5IGJlZW4gb25saW5lIGVhcmxpZXIuCj4gICAgICAgICAgKiBUb3VjaCB0
aGUgd2F0Y2hkb2cgb24gdGhlIG5leHQgQ1BVIHRvIGF2b2lkIGZhbHNlIHBvc2l0aXZlCj4gICAg
ICAgICAgKiBpZiB3ZSB0cnkgdG8gY2hlY2sgaXQgaW4gbGVzcyB0aGVuIDMgaW50ZXJydXB0cy4K
PiAgICAgICAgICAqLwo+ICAgICAgICAgbmV4dF9jcHUgPSB3YXRjaGRvZ19uZXh0X2NwdShjcHUp
Owo+ICAgICAgICAgaWYgKG5leHRfY3B1IDwgbnJfY3B1X2lkcykKPiAgICAgICAgICAgICAgICAg
cGVyX2NwdSh3YXRjaGRvZ190b3VjaCwgbmV4dF9jcHUpID0gdHJ1ZTsKPgo+IEFsdGVybmF0aXZl
IHdvdWxkIGJlIHRvIGNsZWFyIHdhdGNoZG9nX2hydGltZXIuIEJ1dCBpdCB3b3VsZCBraW5kLW9m
Cj4gYWZmZWN0IGFsc28gdGhlIHNvZnRsb2NrdXAgZGV0ZWN0b3IuCgpMb29rcyByZWFzb25hYmxl
LiBJJ3ZlIGluY29ycG9yYXRlZCBpdC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBv
cnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
