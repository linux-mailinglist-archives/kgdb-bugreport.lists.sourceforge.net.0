Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2577FA562
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Nov 2023 16:56:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1r7dyU-0004vG-Mv
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 27 Nov 2023 15:56:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1r7dyR-0004uz-FO
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 27 Nov 2023 15:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GFaRky8SH2nzDL09jU7hfFgInTA8lMAJYDsp98sTKqc=; b=BZXjQ+tDvym4kJqzH1ro1xAHPa
 GGglT3RPwTa2BryHqaGG0oO7ZI3n+ylpfBvYnh5d8DycUCtTpPkTwMNeQr5c3UBcswQiPNBhlLk/d
 wv204pU+RtA5JVUnoWBgJi6MYBdvZnJJj6+dLcXUQpjBKGPy6pn8v3HQ7DqPXyqQoLx4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GFaRky8SH2nzDL09jU7hfFgInTA8lMAJYDsp98sTKqc=; b=VF3NlR7aQqaBO5wYe+q891uSte
 CAfy6eSHQ7MZrHaNbv3WIMlg07YBYlEiCwP5MrXkf6eprw7AKa/hIg8Fqb/Ghu7Bgb83AUEYtya7Y
 wWjWLV0kS2oB4DEjmp2ZtsXbcPAWKiLcTeol1f6lKxcA7aZe6BQepwCNp1ZpJYDZrDpM=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r7dyO-00012N-6A for kgdb-bugreport@lists.sourceforge.net;
 Mon, 27 Nov 2023 15:56:39 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so49406671fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Nov 2023 07:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701100580; x=1701705380;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFaRky8SH2nzDL09jU7hfFgInTA8lMAJYDsp98sTKqc=;
 b=e3tF9YRzrgSH7TG2scDNqcUc4qMXRab8Nre+3BE6GadUGUa0z3Tx2UU3z858x+FjWC
 8zTnaS2S92UFALCh3WxBZDBsaozCZrblVhuyQE3DqAW7J8+O5myolLuTUbaVqVE7HkvH
 P3Re9p89aEhnzfayo5hxQsJ3C0xBS4aPOs2uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701100580; x=1701705380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFaRky8SH2nzDL09jU7hfFgInTA8lMAJYDsp98sTKqc=;
 b=q8KQVYvAApteu8RxA798TWIS5iOA4wa9sFTqJrgwzGjbFz5KeyvovZjNBs8SFKLgIB
 mWxSSbltkTQIuUJ/VLyIW3w/mQkUILi43diAH5yMX7lfm+PcUw5u02DLoBg728y5uNwH
 1ixclxJVD5Gz3vPwZiORTnuWCL/utwLKFmUYNkUp1Z+hqeH1YLxN7/TZtW/PWHg//tPX
 GqSIiOneKkGT4WoYuP6GWmoYGaZNAgES+CMVHC46HE4ZIXUx+UiX9nr6vJsFccLs21T0
 F+RsPNnEwTw4xsZaxKpEAC2mIQBdgvzWdYfsP9kolZ15q120qWh1CEzb9h9BZClbK2kj
 lKEA==
X-Gm-Message-State: AOJu0Yyx4SrpHh7wUu3f5pVJB/togH3jz0US3+uLOuVkq7Zc37UF1mrP
 WSUWMvbdSTBNuLuDIs3rP9KP5s1TCY4Ke9O0ORNMEg==
X-Google-Smtp-Source: AGHT+IFf+Qyml9HCt8IiPPAE0SlcN7i2uPHrBrE1/VOk63P/CFYaO9k/0EGmNmEDhFDT6a4tHqxTjg==
X-Received: by 2002:a17:906:3f12:b0:a0d:decd:8770 with SMTP id
 c18-20020a1709063f1200b00a0ddecd8770mr2978165ejj.59.1701098736690; 
 Mon, 27 Nov 2023 07:25:36 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 m23-20020a1709066d1700b00a121e5d002bsm82145ejr.174.2023.11.27.07.25.35
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 07:25:36 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so205975e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Nov 2023 07:25:35 -0800 (PST)
X-Received: by 2002:a05:600c:3c83:b0:3f4:fb7:48d4 with SMTP id
 bg3-20020a05600c3c8300b003f40fb748d4mr587134wmb.3.1701098735390; Mon, 27 Nov
 2023 07:25:35 -0800 (PST)
MIME-Version: 1.0
References: <dfb1a9a26d7f974371ff1d3e29eba80ef075d465.1700913863.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <dfb1a9a26d7f974371ff1d3e29eba80ef075d465.1700913863.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Nov 2023 07:25:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ui9bpzkn1EP9VCWGkk5+Q2E9D7QHxPy=2x9avMuNqARg@mail.gmail.com>
Message-ID: <CAD=FV=Ui9bpzkn1EP9VCWGkk5+Q2E9D7QHxPy=2x9avMuNqARg@mail.gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Nov 25, 2023 at 4:05 AM Christophe JAILLET <christophe.jaillet@wanadoo.fr>
    wrote: > > When appending "[defcmd]" to 'kdb_prompt_str', the size of the
    string > already in the buffer should be [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.174 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7dyO-00012N-6A
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Fix a potential buffer
 overflow in kdb_local()
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Martin Hicks <mort@sgi.com>,
 kgdb-bugreport@lists.sourceforge.net, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIE5vdiAyNSwgMjAyMyBhdCA0OjA14oCvQU0gQ2hyaXN0b3BoZSBKQUlMTEVU
CjxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cj4KPiBXaGVuIGFwcGVuZGlu
ZyAiW2RlZmNtZF0iIHRvICdrZGJfcHJvbXB0X3N0cicsIHRoZSBzaXplIG9mIHRoZSBzdHJpbmcK
PiBhbHJlYWR5IGluIHRoZSBidWZmZXIgc2hvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KPgo+
IEFuIG9wdGlvbiBjb3VsZCBiZSB0byBzd2l0Y2ggZnJvbSBzdHJuY2F0KCkgdG8gc3RybGNhdCgp
IHdoaWNoIGRvZXMgdGhlCj4gY29ycmVjdCB0ZXN0IHRvIGF2b2lkIHN1Y2ggYW4gb3ZlcmZsb3cu
Cj4KPiBIb3dldmVyLCB0aGlzIGFjdHVhbGx5IGxvb2tzIGFzIGRlYWQgY29kZSwgYmVjYXVzZSAn
ZGVmY21kX2luX3Byb2dyZXNzJwo+IGNhbid0IGJlIHRydWUgaGVyZS4KPiBTZWUgYSBtb3JlIGRl
dGFpbGVkIGV4cGxhbmF0aW9uIGF0IFsxXS4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL0NBRD1GVj1XU2g3d0tON1lwLTN3V2lEZ1g0RTNpc1E4dWgwTEN6VG1kMXY5Q2c5aitu
UUBtYWlsLmdtYWlsLmNvbS8KPgo+IEZpeGVzOiA1ZDUzMTRkNjc5NWYgKCJrZGI6IGNvcmUgZm9y
IGtnZGIgYmFjayBlbmQgKDEgb2YgMikiKQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgSkFJ
TExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2
MjoKPiAgICAtIERlbGV0ZSB0aGUgc3RybmNhdCgpIGNhbGwgICBbRG91ZyBBbmRlcnNvbl0KPgo+
IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMGIxNzkwY2E5MWI3MWUzMzYyYTZhNGMy
ODYzYmM1Nzg3YjRkNjBjOS4xNjk4NTAxMjg0LmdpdC5jaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRv
by5mci8KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIHwgMiAtLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVw
b3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
