Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D6FA6A916
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Mar 2025 15:52:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tvHFu-0004LI-AQ
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 20 Mar 2025 14:52:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tvHFs-0004L9-Kk
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Mar 2025 14:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Ww+0bTeyue6svnMeKBSk/xdNyoWqvfMEKk7bLUAAgc=; b=NF4BeMP9Pxn+ZyegRuJPmKXPMM
 CuTjNqDGXqzTXpmhZRIuRVqf8hb/yX75kIPyaPKCE1bvOKg8rykLu9EeGsN8soFt8H6fr9CG8+nCo
 DoVxgAjN1l84HRyFWLPCg5zYRHJdduclUYVqzLFAAE8RXHonPd5DaxE6qB25E4At6GIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Ww+0bTeyue6svnMeKBSk/xdNyoWqvfMEKk7bLUAAgc=; b=dyyIiL6tLiUwQRh6j439Dhx7bv
 ePyZ/LyK+UN57mBPcsxRbYccexLgu9d4cgvGrmFj6u81xyqv8Aw/tfJiuy0ctWe8RacL6sRb3Av8F
 H3PiGJq+lgqNAqRB+5BGUoq/+tin0yl9CJ7zj6TdPiZjqgsao284YFhkElhdf0x7gV0Q=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tvHFh-0005xy-VO for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Mar 2025 14:52:20 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so363957466b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 20 Mar 2025 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742482323; x=1743087123;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Ww+0bTeyue6svnMeKBSk/xdNyoWqvfMEKk7bLUAAgc=;
 b=eRcxxbPK7/MIZpSaSBFQMh/G/8zu3s9Op6/UlzLMyc/roZLP/dZ7HcHlpka/0K1Z65
 YeSkYAL4Owm/S46LouthTBWsmXthaiYimtv9VmZouukfxlpRX5dUCsEF+Vf/jKklFO5w
 X7wE+z5uFAt/mmqsDLL46WqZHb6CirqYiOcjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742482323; x=1743087123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ww+0bTeyue6svnMeKBSk/xdNyoWqvfMEKk7bLUAAgc=;
 b=h7KNWgGIdNMpiVS2d5ixVAx0tkjyXvqq7vH2Ul0Gui3mJQX4UqbYfMBLdezpuEljr3
 LgLJOFvP+ROaVMQZIANx6qD21ek+HM36G+qcZOCKxBEGTXyh9XUNMVcyPdKkpht+p7Wx
 O6VnM/5zh0WuZailkuB6MqN4U6SzsbYHdCFvRtlxMm7jbjQlq5XQPRJ9kzJEnLgLb7AX
 7iE0BETPQ2mAhpnpYC4z86sg1ay5uTRHnaVUUVLkeyrRUEMrKngi7XdmXpPBCukmSdxF
 fXwAFQ0Rd8TXJ7ZZ/wbo5oz9nsuViVM7Y5ld6lb6+nHnu6gQWo67jrj/acRUGRRgRRyO
 hd2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxLrENO8/zQ9OBqnXcU99u1UpkXEoFzFDI+NXZMm1r284ySByC/uGu7mavgjFsX3h+/BIavRcKppWZx9wnBg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxDxvvn1ONG7ZbyAF3udLkIVI0cUIHX+YHeGj4HFThfyogDcGn1
 YmgfP4I1utW1ZI0EogT8foOGhMF5WPOj1VGZBsHIdGsXwr+BiZMUGL0UYlJZTO+FdOO3y4pNUav
 CSHqq
X-Gm-Gg: ASbGncsBYWi8dmzLvRMnul+hcbMfhOeqrJc46660M6vYXD5CBTch3cZ3URCbO9oPXtJ
 hHY3MwXjAWZrdV5WTT2OuB0UTjCSqgH9NfG8sX/7AfPev21bvb/I+ac7MS2h2HsercfcAw8bdkG
 5Q7n1fusTpCDLA+S0nTjj9ry1Av0yPMm3JOqDVopnm6KHmeDdubolLebqcm78b5PsJtvxMRnjIo
 aUD89+EO6WKU8BWeQ2d1cd+4TyqTGdLDnYfmelAnT4ZQztSxRKqDF90FPXiCss3V/zfUEMKIFH+
 jtC71oZlfh5tg6FpgkVYkEzObvb9Jf7NzFhrOVWdlbJ1uxjQPcQfhs4bbrFXLAAko+GrlXskg6q
 7TlvxQlFy
X-Google-Smtp-Source: AGHT+IEobUKqcNWcYjpGYx7di9p0iigbl2470/iIRf53IuIcUElN9AbGhVJgV+nTQX9TDlKXymHhdQ==
X-Received: by 2002:a05:6512:b99:b0:549:5a14:96d with SMTP id
 2adb3069b0e04-54acfadcd79mr1362352e87.19.1742480899671; 
 Thu, 20 Mar 2025 07:28:19 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54acf942e24sm233971e87.51.2025.03.20.07.28.18
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 07:28:18 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54991d85f99so2179669e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 20 Mar 2025 07:28:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ1WtZiFqlHujsC+VJ36BoHv1tqHyKv7+3XxmOfECiymE/69D4+pPFSYDSl3RobyyzoCBiUUSYkyymkF1SSw==@lists.sourceforge.net
X-Received: by 2002:a05:6512:238d:b0:549:94fb:ecfb with SMTP id
 2adb3069b0e04-54acfaa1b01mr1619820e87.15.1742480898219; Thu, 20 Mar 2025
 07:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250319163341.2123-2-thorsten.blum@linux.dev>
In-Reply-To: <20250319163341.2123-2-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Mar 2025 07:28:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKiPk=G_ZauCwjDqNQuANpoy_jt=nwU1LKj9Ruq2yAaw@mail.gmail.com>
X-Gm-Features: AQ5f1JpMNxEN2a0_e9j_OWlkN8Z_5_oZ0bAFAj4yNCnYZV9svYCZXueqb4XkgEw
Message-ID: <CAD=FV=VKiPk=G_ZauCwjDqNQuANpoy_jt=nwU1LKj9Ruq2yAaw@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Mar 19, 2025 at 9:35 AM Thorsten Blum <thorsten.blum@linux.dev>
    wrote: > > If the destination buffer has a fixed length, strscpy() automatically
    > determines the size of the destination buff [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.42 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.42 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.42 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tvHFh-0005xy-VO
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Remove optional size arguments
 from strscpy() calls
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1hciAxOSwgMjAyNSBhdCA5OjM14oCvQU0gVGhvcnN0ZW4gQmx1bSA8dGhv
cnN0ZW4uYmx1bUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gSWYgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZl
ciBoYXMgYSBmaXhlZCBsZW5ndGgsIHN0cnNjcHkoKSBhdXRvbWF0aWNhbGx5Cj4gZGV0ZXJtaW5l
cyB0aGUgc2l6ZSBvZiB0aGUgZGVzdGluYXRpb24gYnVmZmVyIHVzaW5nIHNpemVvZigpIGlmIHRo
ZQo+IGFyZ3VtZW50IGlzIG9taXR0ZWQuIFRoaXMgbWFrZXMgdGhlIGV4cGxpY2l0IHNpemVvZigp
IHVubmVjZXNzYXJ5Lgo+Cj4gRnVydGhlcm1vcmUsIENNRF9CVUZMRU4gaXMgZXF1YWwgdG8gc2l6
ZW9mKGtkYl9wcm9tcHRfc3RyKSBhbmQgY2FuIGFsc28KPiBiZSByZW1vdmVkLiBSZW1vdmUgdGhl
bSB0byBzaG9ydGVuIGFuZCBzaW1wbGlmeSB0aGUgY29kZS4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcyBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPHRob3JzdGVu
LmJsdW1AbGludXguZGV2Pgo+IC0tLQo+ICBrZXJuZWwvZGVidWcva2RiL2tkYl9pby5jIHwgNCAr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpS
ZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVw
b3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
