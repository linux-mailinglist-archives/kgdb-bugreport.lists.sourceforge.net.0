Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7AA951EBD
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Aug 2024 17:38:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1seG5N-0001t4-Gp
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Aug 2024 15:38:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1seG5M-0001sw-7y
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 15:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2RlAyCTktp8Ohy45ZHsZAJWDLcmSeRRB2NVCChV9/Eg=; b=e+rXmKRqkpAWryxHboJdplWg15
 P6PDhe9KBIrgpwBlqCE0kWTu+QXkeKL+M8RWO3SpLYl/23hWjeCfU5AdUDG5C5+w2EundSnP+1rtA
 O/It1rCzderema/kMpLAy+61AseN6XuhWXPu36/4HYwTR3gEDrdlboWbS7IPDsAgvaMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2RlAyCTktp8Ohy45ZHsZAJWDLcmSeRRB2NVCChV9/Eg=; b=IXUp4+gSPpBBZQsEJAgHmGBQoi
 iHR7t9s5qCvfWEDJUsacR+wVlXXTb02zfD1l4JuuF8opbA5lkDGQdPBHm7HnjCNPQ1K6CO7mioejE
 QsBxtgVdrOCpLTIhoO3ne/XVaQ7Apg1PRYyy6uInf69VtbU0x4Z8L4kq/B+MAE5GTGKY=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1seG5M-000263-9f for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 15:38:52 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42808071810so50529305e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Aug 2024 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723649926; x=1724254726; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2RlAyCTktp8Ohy45ZHsZAJWDLcmSeRRB2NVCChV9/Eg=;
 b=rDh8h2MFRAy0SEMUTMh0aPSFWgajhhq9RI2S0DgQtex1wg/x55e5A7lTB3f6COtH0M
 k6l4fDz+WKl3GJgzjG3WAHS7pjgP7ZgBr/sg8txg0TqaXGGWfgdAFeGgUaAg983BPMb7
 dcIXJXozrgfet6KYJWKhwoPYB1lZe7jit3Z3k7KDbh8rhkJ0qXAd5qzf1tz63gonPMGh
 tDmY+yGRE6QGKE/pF5o1m+aotWMVrfnIkkAtn+WYlepMZf4BxYWLkmKbxs/Q0YoRPjl5
 r3RYK4zlB5Og7ZriUXTM68L68l1qrwqFX7qHBuRKNZoXfQxDbmzD5dxPfVP8vdBM4Ck/
 RuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723649926; x=1724254726;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2RlAyCTktp8Ohy45ZHsZAJWDLcmSeRRB2NVCChV9/Eg=;
 b=LpWVH1rV7kdMcKj4hwo5zeKOWSgPZ0pqAHKY57eyy9LfIV+D/Me+q01+1cVlEdjwRa
 via0ndBOfwS5k7y2cnALJFCVTFve/NmLE+qa/pqHb94z+YHgxvI5XSuAKEdU+8Pf+4j+
 DPrxw1qx3JrZ5av3rg6NOqOvPf+CbwBvJBKzvaZvqLX1vNB/Fm2+tV91OBe5bqzXMImg
 Mun7ePZBqmHLaXQZdiy5XS6kUDGg3EcSAZIovKbzENgf9ZFuP6vzDRLf/fnXSoQxRp3H
 wkRjLYgO4Y4Cjf/rYOGTu2fIo4n78cmORHc/RxOc7S27W0R1diUFbEsuw3u8CUMEqWEP
 u3ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY8D3XTDk6a/4wZFDDmNW58mM2UUP0+boqZB3x4gW202vX9r7iQVju4XKkX2IKR13WOj1WBHkBd60pc/Q+jgQB7ta7IUXVenQKNrGiZFV9XMJEOmI=
X-Gm-Message-State: AOJu0YzHfYBaPQjzIEmPVxHXLEsjngtg75Zeh0FKOgDo3peuyOKms9Gb
 +X9ifhNG+TunMVGkIYpI/NozbaqUMKaV1bmYITvfKWRVfPoF7glR8bIOGd+QPClhWLw+/keJyIT
 Sb8I=
X-Google-Smtp-Source: AGHT+IH9wL7tffaLYUYk3ZHAahngdbyDa6YrmMgjASAFwrlFIshp1+vTMEOATmYfSlMQUgZivFb07w==
X-Received: by 2002:a05:600c:1da5:b0:427:abed:3602 with SMTP id
 5b1f17b1804b1-429dd2603d8mr21605485e9.24.1723649925449; 
 Wed, 14 Aug 2024 08:38:45 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded367ebsm23950265e9.25.2024.08.14.08.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 08:38:45 -0700 (PDT)
Date: Wed, 14 Aug 2024 16:38:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20240814153843.GA168155@aspen.lan>
References: <20240812085459.291741-1-mail@florommel.de>
 <CAD=FV=VC20PvOPSf9quqghA8SKKkCduadtU7nso4wkSwVKH3jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VC20PvOPSf9quqghA8SKKkCduadtU7nso4wkSwVKH3jQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 12, 2024 at 01:04:22PM -0700, Doug Anderson wrote:
    > Hi, > > On Mon, Aug 12, 2024 at 1:55 AM Florian Rommel <mail@florommel.de>
    wrote: > > > > The test for access watchpoints (hw_access_ [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.43 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1seG5M-000263-9f
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: fix hw_access_break_test
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
Cc: Arnd Bergmann <arnd@arndb.de>, kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Florian Rommel <mail@florommel.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDE6MDQ6MjJQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIE1vbiwgQXVnIDEyLCAyMDI0IGF0IDE6NTXigK9BTSBGbG9yaWFu
IFJvbW1lbCA8bWFpbEBmbG9yb21tZWwuZGU+IHdyb3RlOgo+ID4KPiA+IFRoZSB0ZXN0IGZvciBh
Y2Nlc3Mgd2F0Y2hwb2ludHMgKGh3X2FjY2Vzc19icmVha190ZXN0KSB3YXMgYnJva2VuCj4gPiAo
YWx3YXlzIGZhaWxlZCkgYmVjYXVzZSB0aGUgY29tcGlsZXIgb3B0aW1pemVkIG91dCB0aGUgd3Jp
dGUgdG8gdGhlCj4gPiBzdGF0aWMgaGVscGVyIHZhcmlhYmxlIChod19icmVha192YWwyKSwgYXMg
aXQgaXMgbmV2ZXIgcmVhZCBhbnl3aGVyZS4KPiA+IFRoaXMgcmVzdWx0ZWQgaW4gdGhlIHRhcmdl
dCB2YXJpYWJsZSAoaHdfYnJlYWtfdmFsKSBub3QgYmVpbmcgYWNjZXNzZWQKPiA+IGFuZCB0aHVz
IHRoZSBicmVha3BvaW50IG5vdCBiZWluZyB0cmlnZ2VyZWQuCj4gPgo+ID4gUmVtb3ZlIHRoZSBo
ZWxwZXIgdmFyaWFibGUgKGh3X2JyZWFrX3ZhbDIpLCBhbmQgdXNlIFJFQURfT05DRSB0byBmb3Jj
ZQo+ID4gcmVhZGluZyB0aGUgdGFyZ2V0IHZhcmlhYmxlIChod19icmVha192YWwpLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gUm9tbWVsIDxtYWlsQGZsb3JvbW1lbC5kZT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvbWlzYy9rZ2RidHMuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBSZXZpZXdlZC1ieTogRG91Z2xh
cyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKTG9va3MgZ29vZC4gSSBwdXNoZWQg
dGhpcyB0aHJvdWdoIGtnZGJ0ZXN0IGFuZCBpdCBsaWtlcyBpdCB0b28uIEkgY2FuCnR1cm4gb25l
IG9mIHRoZSBYRkFJTHMgb2ZmICh5YXkpLgoKQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFu
aWVsLnRob21wc29uQGxpbmFyby5vcmc+ClRlc3RlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5p
ZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCkFybmQvR3JlZzogQXJlIHlvdSBoYXBweSB0byBwaWNr
IHRoaXMgdXAgb3Igc2hvdWxkIEkgdGFrZSBpdCB0aHJvdWdoIHRoZSBrZ2RiCnRyZWU/IEZXSVcg
cmlnaHQgbm93IHRoZXJlIGFyZSB6ZXJvIG90aGVyIHBhdGNoZXMgZm9yIGtnZGIgdGhpcyBjeWNs
ZSwgYWx0aG91Z2gKdGhhdCBjb3VsZCBjaGFuZ2UhCgoKRGFuaWVsLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcg
bGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
