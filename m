Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C20EF9B38ED
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 19:18:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5UJV-0005DG-R2
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 18:18:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t5UJT-0005D1-OQ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 18:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S5UI8Ycq46pSTtV4R594ykmuHChRzRyHTc8M42JBCVc=; b=kQ1zq5NX8WHx5d0UPS6h8paLAr
 rsl2IG+eWnA4dyHwXwg71qo/MKyYPDVgN0T9Io0B3wdr35bfGSvMiXrpn4fKhLhwIQPh1ntQHCRlT
 ymJ2nGwJx28ZsG/W8Pks+pTKM+BEWz4nzcTjK3I4rqKQ644rGwC4H6tr4GPXgJJrFN2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S5UI8Ycq46pSTtV4R594ykmuHChRzRyHTc8M42JBCVc=; b=d2eIqKraEZ3EwgTRoF4PAnMuGU
 OHY5hX/1r6/8AsGQp0twpFTpsJBtKTxTEpwFOzmdrAuQBCfgkNGpw/AwaKfv54AZPRJ1r4HVlxj4P
 Amk9G9k9mTxOaGgdJnqj8KpL3BZoQO35QeH/khg2wPRILjfn3CphX+nmxdI51DPWAiHE=;
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5UJS-0007tL-6g for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 18:18:00 +0000
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb587d0436so47404201fa.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Oct 2024 11:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730139466; x=1730744266;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5UI8Ycq46pSTtV4R594ykmuHChRzRyHTc8M42JBCVc=;
 b=CohV5+clEac5FNez+h68R8nXeNIGyCkDpxcq5m2VPNQPG7QqWKuK2HH1x4fVvUNZC5
 Y2eL8eJUgDCi4Ro4AB2+Vrhe1xZcJhhzAViUKChFbWgETJczv0mtmdDwZelbKEMBbmiJ
 EDDcavOcoNLNz2iGnmi1JD8Efvxhia9tFK6oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730139466; x=1730744266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S5UI8Ycq46pSTtV4R594ykmuHChRzRyHTc8M42JBCVc=;
 b=I3+KAzX3ufEJ5/A2bRQKle7hwbeW5yavZPNmTS7yXpSUvJIOoA0cEX/tzg0xIDv/Vn
 ZFhdqNXPJeTqzMBT8EfsqW0RIEigSJQxRmaOprviQqLuWDbJRQCasFeMK5eJ0ZTJar6f
 zTz8Pi5KILeAtnlRWzFDLOGHAnvszA+JJLBRb8k/t/6rajJ6Z2LJtZGmmh1MP+zeDf/r
 vcos85ZE2a4HqddAkpaS4fiCk/4/bYwXOAmys+pRe57vDXRl1sp+EK8fGCSKhmWLtEG/
 9+FQy6jozFVzGSzuC1UjNOLNUZC0WZXb8/dWUVjO3LCSAd6Qa7tU67KY+/SK+llTu1My
 2Kgw==
X-Gm-Message-State: AOJu0YwSR5jR22BmO8gJZcjcpYY0PJlo8QmTNEEr0YWU5hxcSqPDK9+f
 cKaaXKB0Uag4u/weHimO9WcIKl1deLtaMMTtANaddB8lAqbMinJrGI/o1iy/w+v6tMJDhL6m120
 aXg==
X-Google-Smtp-Source: AGHT+IHQfE47UU6Lk2Sdz+bWft6wjuil3WE5p0jyEkPfA0kUJFlbj3TGo3WFjGonguYRdOfn4CGDQQ==
X-Received: by 2002:a05:6512:b22:b0:539:a2f5:2f1d with SMTP id
 2adb3069b0e04-53b34c364fdmr3269854e87.61.1730139101850; 
 Mon, 28 Oct 2024 11:11:41 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1c7cf4sm1129193e87.184.2024.10.28.11.11.40
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 11:11:41 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so5139454e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Oct 2024 11:11:40 -0700 (PDT)
X-Received: by 2002:a2e:802:0:b0:2fb:2bda:3872 with SMTP id
 38308e7fff4ca-2fcbe0ae3a7mr28225301fa.45.1730139100482; Mon, 28 Oct 2024
 11:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241026144724.GA892311@lichtman.org>
 <20241026150040.GC892629@lichtman.org>
In-Reply-To: <20241026150040.GC892629@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 11:11:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4Wg9fC7eqhV7sAy-QK6+oE49v2nY0+gnaZpDeA=kiAQ@mail.gmail.com>
Message-ID: <CAD=FV=X4Wg9fC7eqhV7sAy-QK6+oE49v2nY0+gnaZpDeA=kiAQ@mail.gmail.com>
To: Nir Lichtman <nir@lichtman.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Oct 26, 2024 at 8:00 AM Nir Lichtman <nir@lichtman.org>
    wrote: > > Remove logic that enables a fallback of interpreting numbers supplied
    in KDB CLI > to be interpreted as hex without explici [...] 
 
 Content analysis details:   (-0.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.175 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.175 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5UJS-0007tL-6g
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/3] kdb: Remove fallback
 interpretation of arbitrary numbers as hex
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIE9jdCAyNiwgMjAyNCBhdCA4OjAw4oCvQU0gTmlyIExpY2h0bWFuIDxuaXJA
bGljaHRtYW4ub3JnPiB3cm90ZToKPgo+IFJlbW92ZSBsb2dpYyB0aGF0IGVuYWJsZXMgYSBmYWxs
YmFjayBvZiBpbnRlcnByZXRpbmcgbnVtYmVycyBzdXBwbGllZCBpbiBLREIgQ0xJCj4gdG8gYmUg
aW50ZXJwcmV0ZWQgYXMgaGV4IHdpdGhvdXQgZXhwbGljaXQgIjB4IiBwcmVmaXggYXMgdGhpcyBj
YW4gYmUgY29uZnVzaW5nCj4gZm9yIHRoZSBlbmQgdXNlcnMuCj4KPiBTdWdnZXN0ZWQtYnk6IERv
dWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBO
aXIgTGljaHRtYW4gPG5pckBsaWNodG1hbi5vcmc+Cj4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tk
Yi9rZGJfbWFpbi5jIHwgMTYgKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVy
c29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVn
cmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
