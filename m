Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBC9C2042
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 16:22:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9QoZ-0005jD-BD
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 15:22:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t9QoX-0005iv-Bl
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 15:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HgfLZptM6/3AAPLv+VlAD5qO5/FWxVF/aNEVYnKiuLs=; b=aHY4vQvJTBXh2xX9Tpw/O5rVo2
 9KHqopYIcy+l8KTDBlb7HSYyjxlFXcZuV2IZuijwX91q052JQAyIdUunvbVprHhG4dEJnh1Dm1JXA
 B5lz3UQlg/iGU+QLq2a7DS3hDO2ad/LnJmDVDxq7jyVj9/Zis9jpl4oYEaF8LayrG/go=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HgfLZptM6/3AAPLv+VlAD5qO5/FWxVF/aNEVYnKiuLs=; b=ERtZa0vtrcB+tKB6Oae8JHHWe9
 6D9nVsAqSdCL4FkAtuIxmKn9nZd43U++sndrfyJI+ruMai2XKKoL7QmYYNwTNVyQ29FIiIr18Pw8U
 siLO1279xjJW0fHSkJluJ16SyU9UNuGbYoIteJpmqOsRLV79Oyvw12X1NJFc+ecfoJIA=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9QoW-0000JB-LP for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 15:22:21 +0000
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso2585436e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 07:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731079333; x=1731684133;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HgfLZptM6/3AAPLv+VlAD5qO5/FWxVF/aNEVYnKiuLs=;
 b=ZNyCI+9dNpbwaQ9b5YXYLcvBGP6+XDZeowTARi+No7bNzv1cukXgbYEfB6gy6xPRGb
 OhYyXM5CaXoB2jKsk6DlB8ONgFRtSD/wRbKETNVos+wadioeG37fTz9G0BmGF9KTWxtZ
 wyNFe0DMoWp7qSwHIGfd6hGZtB8kjmQ7GKZ6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731079333; x=1731684133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HgfLZptM6/3AAPLv+VlAD5qO5/FWxVF/aNEVYnKiuLs=;
 b=Aq36Z44QAjB0m5AzDQziywY7b9vDi6Ag4IsdoqXMKMThWacn1xG2PDNh7fTEX8KFxo
 uKUjkrNUP1ICkevoEDHiAO64iQDpuy5jbR9P3VPZrrbRv2n6m7FHxXM/BgDZsKEScskI
 lDTSpwTz0Me8Jc7Gr5SAYhddpxs9FIYoWZ5bEu8V1pEOjs3XxoYPltqw/t/TClNAGN1y
 GiyE48lYv/0mKiNzFBTkOeK2ubPZTzCJLK/4HziaMO2Oy0UY4az2PfGm2/VyZXt9ynVI
 jxQQLrrkfcpoq+zqv4Ao4PQphKFoWs21MM7ZCTtYsFdPDA4cWDJmo4FephjG0fP3S+Qd
 Br5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQBD32kvJAP95PYlHtAYCsnVt1lIOn/dWLa/J25K6P7so78+LyJib1JuEW3gXBLZDfjQi02JFsIYL1nnMegA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIEr0I3IcGhID1RyCY6Vto7KlFPWkztUcMP7ED0Y7PLTk+2bvb
 D8Zy1LBRYNhYHv9rf+PUr9oawUMedkN8pnPKg2bLtCDCeP1iEx3KoSNJClTaeQar68JN4sqAZMK
 aHQ==
X-Google-Smtp-Source: AGHT+IFEQmsPNBj+4DOfPky/AjZuwRA5cvQVMM418r/ws0/1Z5aMs1PRg/tQ1rmpinHznsMemk5X1w==
X-Received: by 2002:a05:651c:2227:b0:2fa:bb5d:db67 with SMTP id
 38308e7fff4ca-2ff2025945bmr17096691fa.32.1731079333074; 
 Fri, 08 Nov 2024 07:22:13 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff178df94bsm6850581fa.8.2024.11.08.07.22.12
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 07:22:12 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso2813106e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 07:22:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaF9mEwVjjBQuRId+ti7jTXVlYmfXvho2xm6qxP8gIcRaOoo1E+1/5pyJSkOhAiuJXVSEjr3THaNFAAO+8ew==@lists.sourceforge.net
X-Received: by 2002:a2e:be20:0:b0:2f5:11f6:1b24 with SMTP id
 38308e7fff4ca-2ff201b3185mr20586931fa.18.1731079331685; Fri, 08 Nov 2024
 07:22:11 -0800 (PST)
MIME-Version: 1.0
References: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
In-Reply-To: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Nov 2024 07:21:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XSiNw5RKEPg5wwTn=tNVKDxYoqYZLU5C_88wveD29UCw@mail.gmail.com>
Message-ID: <CAD=FV=XSiNw5RKEPg5wwTn=tNVKDxYoqYZLU5C_88wveD29UCw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Nov 8, 2024 at 12:31 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > Going forward, I'll be using my kernel.org address for upstream
    work. > > Signed-off-by: Daniel Thompson <dani [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.53 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9QoW-0000JB-LP
Subject: Re: [Kgdb-bugreport] [PATCH 0/2] MAINTAINERS: Update with Daniel
 Thompson's korg address
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
Cc: kgdb-bugreport@lists.sourceforge.net, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIE5vdiA4LCAyMDI0IGF0IDEyOjMx4oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBHb2luZyBmb3J3YXJkLCBJJ2xs
IGJlIHVzaW5nIG15IGtlcm5lbC5vcmcgYWRkcmVzcyBmb3IgdXBzdHJlYW0gd29yay4KPgo+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+
Cj4gLS0tCj4gRGFuaWVsIFRob21wc29uICgyKToKPiAgICAgICBNQUlOVEFJTkVSUzogVXNlIERh
bmllbCBUaG9tcHNvbidzIGtvcmcgYWRkcmVzcyBmb3IgYmFja2xpZ2h0IHdvcmsKPiAgICAgICBN
QUlOVEFJTkVSUzogVXNlIERhbmllbCBUaG9tcHNvbidzIGtvcmcgYWRkcmVzcyBmb3Iga2dkYiB3
b3JrCj4KPiAgTUFJTlRBSU5FUlMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkkgZG9uJ3Qga25vdyBpZiBpdCBuZWVkcyBpdCwgYnV0
IGlmIGl0IGRvZXMgZmVlbCBmcmVlIHRvIGhhdmU6CgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKQlRXOiBkbyB5b3Ugd2FudCB0byBhZGp1c3Qg
dGhlICcubWFpbG1hcCcgZmlsZSBhcyB3ZWxsPwoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QK
S2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
